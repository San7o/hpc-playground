#! /bin/sh

# Run this script for start the alma linux image
qemu-system-x86_64 \
        -enable-kvm \
        -boot menu=on \
        -drive file=alma.img \
        -m 4G \
        -cpu host \
        -vga virtio \
        -display sdl,gl=on \
        -device e1000,netdev=net0 \
        -netdev user,id=net0 \
        -nic tap
