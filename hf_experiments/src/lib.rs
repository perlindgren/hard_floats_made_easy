#![no_std]
use core::arch::asm;

/// neg function,
/// pub and #[inline(never)] to ensure float is actually being computed and not optimized out
// #[inline(never)]

#[inline(always)]
pub fn neg(a: f32) -> f32 {
    -a
}

/// add
// #[inline(never)]
// #[unsafe(naked)]
#[inline(always)]
pub fn add(a: f32, b: f32) -> f32 {
    let o: f32;
    unsafe {
        asm!(
            "vadd.f32 {0}, {1}, {2}",
            out(sreg) o,
            in(sreg) a,
            in(sreg) b,
        );
    }
    o
}

// #[inline(always)]
// pub fn vpush() {
//     unsafe {
//         asm!("vpush.f32 {{ S0, S2 }}",);
//     }
// }

#[inline(always)]
pub fn clobber() {
    unsafe {
        asm!("", clobber_abi("C"));
    }
}

#[macro_export]

macro_rules! vadd_asm {
    ( $s0:ident, $s1:ident ) => {
        stringify!(vadd.f32 {:e} , $s0, $s1)
    };
}

#[macro_export]
macro_rules! vadd_asm_reg {
    ( $r:ident ) => {
        stringify!($r)
    };
}

#[macro_export]
macro_rules! vadd  {
    (  $a: expr, $b: expr, $vadd_asm:expr,  $_r1:expr,  $_r2:expr ) => {
        {
            use core::arch::asm;
            #[inline(always)]
            fn add_(a: f32, b: f32) -> f32 {
                let o: f32;
                unsafe {
                    asm!(
                        "vadd.f32 S0 {:e}, {:e}, {:e}",
                        // out($r1) o,
                        // in($r1) a,
                        // in($r2) b,
                        out("S0") o,
                        in("S0") a,
                        in("S1") b,
                    );
                }
                o
            }
            add_($a, $b)
        }
    };
}
