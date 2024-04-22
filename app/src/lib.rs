#[repr(C)]
pub struct TwoU16s {
    one: u16,
    two: u16,
}

extern "C" {
    pub fn rust_dbg_extern_identity_TwoU16s(v: TwoU16s) -> TwoU16s;
}

#[no_mangle]
pub unsafe fn foo() {
    let x = TwoU16s { one: 33, two: 77 };
    rust_dbg_extern_identity_TwoU16s(x);
}
