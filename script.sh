#!/bin/bash
apt install openssh-server ufw -y
cp -r 40_custom /etc/grub.d/40_custom
sed -i '1 s/CLASS="--class gnu-linux --class gnu --class os"/CLASS="--class gnu-linux --class gnu --class os --unrestricted"/' /etc/grub.d/10_linux
grub-mkconfig -o /boot/grub/grub.cfg
cp -r sshd_config /etc/ssh/sshd_config
systemctl restart sshd
cp -r ufw /etc/default/ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow 8001
ufw deny 22/tcp
ufw deny 22
ufw reload
