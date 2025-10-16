##############################################################################
# Simplest convert Rockchip TEE (bl32) binary image into ELF format
#
# Just place this file as tee.ld into rkbin directory, then run
# $ aarch64-linux-gnu-ld -T tee.ld -o tee.elf
# Then build vanilla u-boot with TEE=<you_path>/tee.elf

start_addr = 0x08400000;

TARGET(binary)
INPUT( ./bin/rk35/rk3568_bl32_v2.15.bin )

OUTPUT_FORMAT(elf64-littleaarch64)
ENTRY(start_addr)

MEMORY
{
    RAM (rwx) : org = 0x08400000, len = 1M
}

SECTIONS
{
    .data : {
        ./bin/rk35/rk3568_bl32_v2.15.bin
    } > RAM
}
