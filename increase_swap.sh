#!/bin/sh

# size of 4GB.swap in megabytes
swapsize=4096

# does the swap file already exist?
grep -q "4GB.swap" /etc/fstab

# if not then create it
if [ $? -ne 0 ]; then
  echo '4GB.swap not found. Adding 4GB.swap.'
  dd if=/dev/zero of=/4GB.swap count=${swapsize} bs=1MiB
  #fallocate -l ${swapsize}M /4GB.swap
  chmod 600 /4GB.swap
  mkswap /4GB.swap
  swapon /4GB.swap
  echo '/4GB.swap  none swap defaults 0 0' >> /etc/fstab
else
  echo '4GB.swap found. No changes made.'
fi

# output results to terminal
df -h
cat /proc/swaps
cat /proc/meminfo | grep Swap
