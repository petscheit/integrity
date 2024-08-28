// Recursive with poseidon layout
const BITWISE_RATIO: felt252 = 16;
const BITWISE_ROW_RATIO: felt252 = 256;
const BITWISE_TOTAL_N_BITS: felt252 = 251;
const CONSTRAINT_DEGREE: u32 = 2;
const CPU_COMPONENT_HEIGHT: felt252 = 16;
const CPU_COMPONENT_STEP: felt252 = 1;
const DILUTED_N_BITS: felt252 = 16;
const DILUTED_SPACING: felt252 = 4;
const HAS_BITWISE_BUILTIN: felt252 = 1;
const HAS_DILUTED_POOL: felt252 = 1;
const HAS_EC_OP_BUILTIN: felt252 = 0;
const HAS_ECDSA_BUILTIN: felt252 = 0;
const HAS_KECCAK_BUILTIN: felt252 = 0;
const HAS_OUTPUT_BUILTIN: felt252 = 1;
const HAS_PEDERSEN_BUILTIN: felt252 = 1;
const HAS_POSEIDON_BUILTIN: felt252 = 1;
const HAS_RANGE_CHECK_BUILTIN: felt252 = 1;
const HAS_RANGE_CHECK96_BUILTIN: felt252 = 0;
const IS_DYNAMIC_AIR: felt252 = 0;
const LAYOUT_CODE: felt252 = 0x7265637572736976655f776974685f706f736569646f6e;
const LOG_CPU_COMPONENT_HEIGHT: felt252 = 4;
const MASK_SIZE: u32 = 192;
const N_CONSTRAINTS: u32 = 124;
const N_DYNAMIC_PARAMS: felt252 = 0;
const NUM_COLUMNS_FIRST: u32 = 6;
const NUM_COLUMNS_SECOND: u32 = 2;
const PEDERSEN_BUILTIN_RATIO: felt252 = 256;
const PEDERSEN_BUILTIN_REPETITIONS: felt252 = 1;
const PEDERSEN_BUILTIN_ROW_RATIO: felt252 = 4096;
const POSEIDON_M: felt252 = 3;
const POSEIDON_RATIO: felt252 = 64;
const POSEIDON_ROUNDS_FULL: felt252 = 8;
const POSEIDON_ROUNDS_PARTIAL: felt252 = 83;
const POSEIDON_ROW_RATIO: felt252 = 1024;
const PUBLIC_MEMORY_STEP: felt252 = 16;
const RANGE_CHECK_BUILTIN_RATIO: felt252 = 16;
const RANGE_CHECK_BUILTIN_ROW_RATIO: felt252 = 256;
const RANGE_CHECK_N_PARTS: felt252 = 8;

#[derive(Drop, Copy, Serde)]
struct DynamicParams {}

mod segments {
    const BITWISE: usize = 5;
    const EXECUTION: usize = 1;
    const N_SEGMENTS: usize = 7;
    const OUTPUT: usize = 2;
    const PEDERSEN: usize = 3;
    const POSEIDON: usize = 6;
    const PROGRAM: usize = 0;
    const RANGE_CHECK: usize = 4;
}

fn get_builtins() -> Array<felt252> {
    array!['output', 'pedersen', 'range_check', 'bitwise', 'poseidon']
}
