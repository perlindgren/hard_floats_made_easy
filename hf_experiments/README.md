# hf_experiments

- `cm_test`, minimal example

  ```shell
  cargo build --example cm_test --release
  ```

  ```shell
  cargo objdump --example cm_test --release -- -d > cm_test.s

  tail -15 cm_test.s
  ```

  This should render:
  ```asm
  08000458 <main>:
   8000458: b580          push    {r7, lr}
   800045a: 466f          mov     r7, sp
   800045c: e7fe          b       0x800045c <main+0x4>    @ imm = #-0x4

  0800045e <__pre_init>:
   800045e: b580          push    {r7, lr}
   8000460: 466f          mov     r7, sp
   8000462: bd80          pop     {r7, pc}

  08000464 <HardFault_>:
   8000464: b580          push    {r7, lr}
   8000466: 466f          mov     r7, sp
   8000468: e7fe          b       0x8000468 <HardFault_+0x4> @ imm = #-0x4
   800046a: d4d4          bmi     0x8000416 <__stext+0x16> @ imm = #-0x58
  ```

