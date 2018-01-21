#!/bin/bash
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100
(echo n; echo p; echo 1; echo ''; echo ''; echo w) | sudo fdisk /dev/sda
sudo mkfs.ext4 -O ^metadata_csum,^64bit /dev/sda1
sudo mkdir -p /mnt/sdcard
sudo mount /dev/sda1 /mnt/sdcard
cd /mnt/sdcard
sudo tar -xvf /home/corey/espressobin/rootfs.tar.bz2
cd ..
sudo umount /mnt/sdcard
