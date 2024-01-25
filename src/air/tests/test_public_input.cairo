use cairo_verifier::air::{
    public_memory::AddrValue, public_input::{PublicInput, SegmentInfo},
    public_input::PublicInputTrait
};

fn helper_get_public_input() -> PublicInput {
    PublicInput {
        log_n_steps: 0xe,
        rc_min: 0x7ffa,
        rc_max: 0x8001,
        layout: 0x726563757273697665,
        dynamic_params: array![],
        segments: array![
            SegmentInfo { begin_addr: 0x1, stop_ptr: 0x5 },
            SegmentInfo { begin_addr: 0x25, stop_ptr: 0x68 },
            SegmentInfo { begin_addr: 0x68, stop_ptr: 0x6a },
            SegmentInfo { begin_addr: 0x6a, stop_ptr: 0x6a },
            SegmentInfo { begin_addr: 0x1ea, stop_ptr: 0x1ea },
            SegmentInfo { begin_addr: 0x9ea, stop_ptr: 0x9ea },
        ],
        padding_addr: 0x1,
        padding_value: 0x40780017fff7fff,
        main_page: array![
            AddrValue { address: 0x1, value: 0x40780017fff7fff },
            AddrValue { address: 0x2, value: 0x4 },
            AddrValue { address: 0x3, value: 0x1104800180018000 },
            AddrValue { address: 0x4, value: 0x4 },
            AddrValue { address: 0x5, value: 0x10780017fff7fff },
            AddrValue { address: 0x6, value: 0x0 },
            AddrValue { address: 0x7, value: 0x40780017fff7fff },
            AddrValue { address: 0x8, value: 0x1 },
            AddrValue { address: 0x9, value: 0x400380007ffa8000 },
            AddrValue { address: 0xa, value: 0x480680017fff8000 },
            AddrValue { address: 0xb, value: 0x1 },
            AddrValue { address: 0xc, value: 0x480680017fff8000 },
            AddrValue { address: 0xd, value: 0x1 },
            AddrValue { address: 0xe, value: 0x480a80007fff8000 },
            AddrValue { address: 0xf, value: 0x1104800180018000 },
            AddrValue { address: 0x10, value: 0x9 },
            AddrValue { address: 0x11, value: 0x400280017ffa7fff },
            AddrValue { address: 0x12, value: 0x482680017ffa8000 },
            AddrValue { address: 0x13, value: 0x2 },
            AddrValue { address: 0x14, value: 0x480a7ffb7fff8000 },
            AddrValue { address: 0x15, value: 0x480a7ffc7fff8000 },
            AddrValue { address: 0x16, value: 0x480a7ffd7fff8000 },
            AddrValue { address: 0x17, value: 0x208b7fff7fff7ffe },
            AddrValue { address: 0x18, value: 0x20780017fff7ffd },
            AddrValue { address: 0x19, value: 0x4 },
            AddrValue { address: 0x1a, value: 0x480a7ffc7fff8000 },
            AddrValue { address: 0x1b, value: 0x208b7fff7fff7ffe },
            AddrValue { address: 0x1c, value: 0x480a7ffc7fff8000 },
            AddrValue { address: 0x1d, value: 0x482a7ffc7ffb8000 },
            AddrValue { address: 0x1e, value: 0x482680017ffd8000 },
            AddrValue {
                address: 0x1f,
                value: 0x800000000000011000000000000000000000000000000000000000000000000
            },
            AddrValue { address: 0x20, value: 0x1104800180018000 },
            AddrValue {
                address: 0x21,
                value: 0x800000000000010fffffffffffffffffffffffffffffffffffffffffffffff9
            },
            AddrValue { address: 0x22, value: 0x208b7fff7fff7ffe },
            AddrValue { address: 0x23, value: 0x25 },
            AddrValue { address: 0x24, value: 0x0 },
            AddrValue { address: 0x25, value: 0x68 },
            AddrValue { address: 0x26, value: 0x6a },
            AddrValue { address: 0x27, value: 0x1ea },
            AddrValue { address: 0x28, value: 0x9ea },
            AddrValue { address: 0x64, value: 0x6a },
            AddrValue { address: 0x65, value: 0x6a },
            AddrValue { address: 0x66, value: 0x1ea },
            AddrValue { address: 0x67, value: 0x9ea },
            AddrValue { address: 0x68, value: 0xa },
            AddrValue { address: 0x69, value: 0x90 },
        ],
        continuous_page_headers: array![],
    }
}

#[test]
#[available_gas(9999999999)]
fn test_public_input_hash() {
    let public_input = helper_get_public_input();

    assert(
        public_input
            .get_public_input_hash() == u256 {
                low: 0xba9d17a3ebd900899148b125421c118f, high: 0x87433b8dd90acbfe5abea8474d795191
            },
        'Invalid value'
    )
}
