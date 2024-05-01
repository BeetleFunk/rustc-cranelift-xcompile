#[repr(C)]
pub struct TwoU16s {
    first: u16,
    second: u16,
}

extern "C" {
    pub fn extern_c_abi_TwoU16s(v: TwoU16s) -> TwoU16s;
}

#[no_mangle]
pub unsafe fn pass_two_u16s() {
    let x = TwoU16s { first: 33, second: 77 };
    extern_c_abi_TwoU16s(x);
}

#[repr(C)]
pub struct FiveU16s {
    first: u16,
    second: u16,
    third: u16,
    fourth: u16,
    fifth: u16,
}

#[no_mangle]
pub extern "C" fn receive_five_u16s(x: FiveU16s) -> bool {
    return x.first > x.fifth;
}
