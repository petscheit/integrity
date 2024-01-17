use cairo_verifier::common::{
    array_append::ArrayAppendTrait, blake2s::blake2s, math::pow, blake2s::truncated_blake2s,
    flip_endianness::FlipEndiannessTrait, math::DivRemFelt252, math::Felt252PartialOrd
};
use cairo_verifier::channel::channel::{Channel, ChannelImpl};
use poseidon::hades_permutation;

// Commitment for a vector of field elements.
#[derive(Drop, Copy, PartialEq)]
struct VectorCommitment {
    config: VectorCommitmentConfig,
    commitment_hash: felt252
}

#[derive(Drop, Copy, PartialEq)]
struct VectorCommitmentConfig {
    height: felt252,
    n_verifier_friendly_commitment_layers: felt252,
}

#[generate_trait]
impl VectorCommitmentConfigImpl of VectorCommitmentConfigTrait {
    fn validate(
        self: @VectorCommitmentConfig,
        expected_height: felt252,
        n_verifier_friendly_commitment_layers: felt252,
    ) {
        assert(*self.height == expected_height, 'height mismatch');
        // Note that n_verifier_friendly_commitment_layers can be greater than height (in such a case,
        // all Merkle layers use the verifier-friendly hash).
        assert(
            *self.n_verifier_friendly_commitment_layers == n_verifier_friendly_commitment_layers,
            'n_verifier_friendly... mismatch'
        );
    }
}

// A query to the vector commitment.
#[derive(Drop, Copy)]
struct VectorQuery {
    index: felt252,
    value: felt252,
}

// A query to the vector commitment that contains also the depth of the query in the Merkle tree.
#[derive(Drop, Copy)]
struct VectorQueryWithDepth {
    index: felt252,
    value: felt252,
    depth: felt252,
}

// Witness for a decommitment over queries.
#[derive(Drop, Copy)]
struct VectorCommitmentWitness {
    // The authentication values: all the siblings of the subtree generated by the queried indices,
    // bottom layer up, left to right.
    authentications: Span<felt252>,
}

fn vector_commit(
    ref channel: Channel, unsent_commitment: felt252, config: VectorCommitmentConfig
) -> VectorCommitment {
    channel.read_truncated_hash_from_prover(unsent_commitment); // commitment is being sent
    VectorCommitment { config: config, commitment_hash: unsent_commitment, }
}

// Decommits a VectorCommitment at multiple indices.
// Indices must be sorted and unique.
fn vector_commitment_decommit(
    commitment: VectorCommitment, queries: Span<VectorQuery>, witness: VectorCommitmentWitness,
) {
    let shift = pow(2, commitment.config.height);
    let shifted_queries = shift_queries(queries, shift, commitment.config.height);

    let expected_commitment = compute_root_from_queries(
        shifted_queries,
        0,
        commitment.config.n_verifier_friendly_commitment_layers,
        witness.authentications,
        0
    );

    assert(expected_commitment == commitment.commitment_hash, 'decommitment failed');
}

// Verifies a queue of Merkle queries. [queue_head, queue_tail) is a queue, where each element
// represents a node index (given in a heap-like indexing) and value (either an inner
// node or a leaf).
fn compute_root_from_queries(
    mut queue: Array<VectorQueryWithDepth>,
    start: u32,
    n_verifier_friendly_layers: felt252,
    authentications: Span<felt252>,
    auth_start: u32
) -> felt252 {
    let current: VectorQueryWithDepth = *queue[start];

    if current.index == 1 { // root
        assert(current.depth == 0, 'root depth must be 0');
        assert(start + 1 == queue.len(), 'root must be the last element');
        assert(auth_start == authentications.len(), 'authentications is too long');
        return current.value;
    }

    let (parent, bit) = DivRem::div_rem(current.index, 2.try_into().unwrap());
    let is_verifier_friendly = n_verifier_friendly_layers >= current.depth;
    let hash = if bit == 0 {
        if start + 1 != queue.len() {
            let next: VectorQueryWithDepth = *queue[start + 1];
            if current.index + 1 == next.index {
                // next is a sibling of current
                let hash = hash_blake_or_poseidon(current.value, next.value, is_verifier_friendly);
                queue
                    .append(
                        VectorQueryWithDepth {
                            index: parent, value: hash, depth: current.depth - 1,
                        }
                    );
                return compute_root_from_queries(
                    queue, start + 2, n_verifier_friendly_layers, authentications, auth_start
                );
            }
        }
        assert(auth_start != authentications.len(), 'authentications is too short');
        hash_blake_or_poseidon(current.value, *authentications[auth_start], is_verifier_friendly)
    } else {
        assert(auth_start != authentications.len(), 'authentications is too short');
        hash_blake_or_poseidon(*authentications[auth_start], current.value, is_verifier_friendly)
    };
    queue.append(VectorQueryWithDepth { index: parent, value: hash, depth: current.depth - 1, });
    compute_root_from_queries(
        queue, start + 1, n_verifier_friendly_layers, authentications, auth_start + 1
    )
}

// Shifts the query indices by shift=2**height, to convert index representation to heap-like.
// Validates the query index range.
fn shift_queries(
    queries: Span<VectorQuery>, shift: felt252, height: felt252
) -> Array<VectorQueryWithDepth> {
    let mut shifted_queries = ArrayTrait::new();
    let mut i = 0;
    loop {
        if i == queries.len() {
            break;
        };
        let q = *queries[i];
        shifted_queries
            .append(
                VectorQueryWithDepth { index: q.index + shift, value: q.value, depth: height, }
            );
        i += 1;
    };
    shifted_queries
}

fn hash_blake_or_poseidon(x: felt252, y: felt252, is_verifier_friendly: bool) -> felt252 {
    if is_verifier_friendly {
        let (hash, _, _) = hades_permutation(x, y, 2);
        hash
    } else {
        truncated_blake2s(x, y)
    }
}
