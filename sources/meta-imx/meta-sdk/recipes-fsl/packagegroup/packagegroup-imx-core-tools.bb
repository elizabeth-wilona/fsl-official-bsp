# Copyright 2018-2020 NXP
# Released under the MIT license (see COPYING.MIT for the terms)

DESCRIPTION = "Packagegroup to provide necessary tools for basic core image"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

KERNEL_TEST_TOOLS      = "kernel-tools-pci spidev-test"
KERNEL_TEST_TOOLS_mx8m = "kernel-tools-pci spidev-test kernel-tools-virtio"


RDEPENDS_${PN} = " \
    dosfstools \
    evtest \
    e2fsprogs-mke2fs \
    fsl-rc-local \
    fbset \
    i2c-tools \
    iproute2 \
    ${KERNEL_TEST_TOOLS} \
    memtester \
    python-subprocess \
    python-datetime \
    python-json \
    ethtool \
    mtd-utils \
    mtd-utils-ubifs \
    procps \
    ptpd \
    linuxptp \
    iw \
    can-utils \
    cpufrequtils \
    nano \
    ntpdate \
    minicom \
    coreutils \
    mmc-utils \
    udev-extraconf \
    e2fsprogs-resize2fs \
"
