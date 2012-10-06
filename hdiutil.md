hdiutil convert -format UDRW -o ~/path/to/target.img ~/path/to/ubuntu.iso


/dev/disk1
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *975.2 MB   disk1
   1:                 DOS_FAT_16                         973.9 MB   disk1s1

diskutil list
diskutil unmountDisk disk1
sudo dd if=/Users/toast/Downloads/balder10.img of=/dev/disk1 bs=1m
diskutil eject /dev/disk1
