#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Not root. Abort, abort" 1>&2
    exit 1
fi

umount /dev/sdb?

if [[ $? -ne 0 ]]; then
    echo "umount has failed" 1>&2
    exit 1
fi

echo -e "o\nn\n\n\n\n\nt\nc\nw\n" | fdisk /dev/sdb 

mkfs.vfat -F 32 /dev/sdb1

