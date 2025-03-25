#!/bin/bash

mkdir -p /var/run/vsftpd/empty

cat <<EOF > /etc/vsftpd.conf

listen=YES

anonymous_enable=NO
local_enable=YES
write_enable=YES

local_umask=022

xferlog_enable=YES

pasv_enable=YES

# pasv_address=${INCEPTION_IP}

pasv_min_port=30000
pasv_max_port=30009

local_root=/home/${FTP_USER}
secure_chroot_dir=/var/run/vsftpd/empty


EOF

useradd -m -d /home/${FTP_USER} "${FTP_USER}"
echo "${FTP_USER}:${FTP_PASS}" | chpasswd
service vsftpd stop

/usr/sbin/vsftpd /etc/vsftpd.conf