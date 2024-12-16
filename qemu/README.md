# Qemu

With qemu we can easily create virtual machines. This is very
nice for experiments and setting up some kind of lab.

This directory contains some useful script to setup some
virtual machines.

The general steps are the follosing:
1. Download your favourite iso
2. Create an image file, this will contain the filesystem
   and all the necessary files to boot the installed os

```bash
qemu-img create -f qcow2 Image.img 20G
```

3. Install the os from the iso

```bash
qemu-system-x86_64 \
    -enable-kvm \
    -cdrom ubuntu.iso \
    -boot menu=on \
    -drive file=Image.img \
    -m 4G \
    -cpu host \
    -vga virtio \
    -display sdl,gl=on
```

4. Boot the machine

```bash
qemu-system-x86_64 \
    -enable-kvm \
    -boot menu=on \
    -drive file=Image.img \
    -m 4G \
    -cpu host \
    -vga virtio \
    -display sdl,gl=on
```

5. Enjoy
