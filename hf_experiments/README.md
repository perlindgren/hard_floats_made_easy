# hf_experiments

- `cm_test`, 

  ```shell
  cargo build --example cm_preempt --target thumbv7em-none-eabihf --no-default-features --features cm
  ```

- `std_cs`, shows the new CS API with the stock Mutex API. Backing `Impl` comes from the stock `critical-section`.

  ```shell
  cargo run --example std_cs
  ```

- `std_preempt`, shows the new CS API with the new Mutex API. Backing `Impl` comes from the stock `critical-section`.

  ```shell
  cargo run --example std_cs
  ```
  