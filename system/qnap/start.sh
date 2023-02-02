#!/bin/sh
mount -t ext2 $(/sbin/hal_app --get_boot_pd port_id=0)6 /tmp/config
chmod +x /tmp/config/autorun.sh

# vi /tmp/config/autorun.sh

echo "unmounting /tmp/config..."
# umount /tmp/config

