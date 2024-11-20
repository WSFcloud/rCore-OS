# rCore-OS

## Running environment
Use the provided Dockerfile to get the running environment.

Make sure you have the following software installed:
- Docker: Verify the installation by running docker --version.
- Docker Compose (if needed): Verify the installation by running docker-compose --version.

Run the following command in the terminal to build the image:
```bash
docker build -t rcore_env .
```
- -t rcore_env specifies the name of the image (you can customize it).
- . refers to the current directory as the build context.

After building the image, start a container with the runtime environment:
```bash
docker run -it --name rcore_container rcore_env
```


## Show runtime debug info of OS kernel version
You could try to run rcore for understand the internal behavior of os kernel.

You can also add the parameter LOG=ERROR/WARN/INFO/DEBUG/TRACE to view logs of different levels.

```sh
$ cd /os
$ make run
......
[rustsbi] RustSBI version 0.3.1, adapting to RISC-V SBI v1.0.0
.______       __    __      _______.___________.  _______..______   __
|   _  \     |  |  |  |    /       |           | /       ||   _  \ |  |
|  |_)  |    |  |  |  |   |   (----`---|  |----`|   (----`|  |_)  ||  |
|      /     |  |  |  |    \   \       |  |      \   \    |   _  < |  |
|  |\  \----.|  `--'  |.----)   |      |  |  .----)   |   |  |_)  ||  |
| _| `._____| \______/ |_______/       |__|  |_______/    |______/ |__|
[rustsbi] Implementation     : RustSBI-QEMU Version 0.2.0-alpha.2
[rustsbi] Platform Name      : riscv-virtio,qemu
[rustsbi] Platform SMP       : 1
[rustsbi] Platform Memory    : 0x80000000..0x88000000
[rustsbi] Boot HART          : 0
[rustsbi] Device Tree Region : 0x87e00000..0x87e0107e
[rustsbi] Firmware Address   : 0x80000000
[rustsbi] Supervisor Address : 0x80200000
[rustsbi] pmp01: 0x00000000..0x80000000 (-wr)
[rustsbi] pmp02: 0x80000000..0x80200000 (---)
[rustsbi] pmp03: 0x80200000..0x88000000 (xwr)
[rustsbi] pmp04: 0x88000000..0x00000000 (-wr)
[kernel] Hello, world!
power_3 [10000/200000]
power_3 [20000/200000]
power_3 [30000/200000]
power_5 [10000/140000]
power_5 [20000/140000]
power_5 [30000/140000]
power_5 [40000/140000]
power_5 [50000/140000]
power_5 [60000/140000]
power_5 [70000/140000]
power_7 [10000/160000]
power_7 [20000/160000]
power_7 [30000/160000]
power_7 [40000/160000]
power_3 [40000/200000]
power_3 [50000/200000]
power_3 [60000/200000]
power_3 [70000/200000]
power_3 [power_5 [80000/140000]
power_5 [90000/140000]
power_5 [100000/140000]
power_5 [110000/140000]
power_5 [120000/140000]
power_5 [130000/140000]
power_5 [140000/140000]
5^140000 = 386471875(MOD 998244353)
Test power_5 OK!
[kernel] Application exited with code 0
[task 1 exited. user_time: 10 ms, kernle_time: 9 ms.
80000/200000]
power_3 [90000/200000]
power_3 [100000/200000]
power_3 [110000/200000]
power_3 [120000/200000]
power_3 [130000/200000]
power_7 [50000/160000]
power_7 [60000/160000]
power_7 [70000/160000]
power_7 [80000/160000]
power_7 [90000/160000]
power_7 [100000/power_3 [140000/200000]
power_3 [150000/200000]
power_3 [160000/200000]
power_3 [170000/200000]
power_3 [180000/200000]
power_3 [190000/200000]
power_3 [200000/200000]
3^200000 = 871008973(MOD 998244353)
Test power_3 OK!
[kernel] Application exited with code 0
[task 0 exited. user_time: 5 ms, kernle_time: 33 ms.
160000]
power_7 [110000/160000]
power_7 [120000/160000]
power_7 [130000/160000]
power_7 [140000/160000]
power_7 [150000/160000]
power_7 [160000/160000]
7^160000 = 667897727(MOD 998244353)
Test power_7 OK!
[kernel] Application exited with code 0
[task 2 exited. user_time: 10 ms, kernle_time: 32 ms.
Test sleep OK!
[kernel] Application exited with code 0
[task 3 exited. user_time: 876 ms, kernle_time: 2056 ms.
All applications completed!
......
```

## Rustdoc
Currently it can only help you view the code since only a tiny part of the code has been documented.

You can open a doc html of `os` using `cargo doc --no-deps --open` under `os` directory.