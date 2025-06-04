#!/bin/bash


apt-get -y update
apt-get -y upgrade

apt install -y curl gnupg2 ca-certificates lsb-release apt-transport-https curl software-properties-common vim git screen wget iproute2 net-tools snapd

snap install snapd


set -e

USER_NAME="wdc"
USER_SHELL="/bin/bash"
SSH_PUB_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEvuQFXxwwpF0Q/QfysozU+6HH0EHUdQfTKaKXlK+pqk wdc@gmail.com"
ENABLE_SUDO_NOPASSWD=true 


echo "add user $USER_NAME"
useradd -m -s $USER_SHELL "$USER_NAME"


SSH_DIR="/home/$USER_NAME/.ssh"
mkdir -p "$SSH_DIR"
echo "$SSH_PUB_KEY" > "$SSH_DIR/authorized_keys"
chmod 700 "$SSH_DIR"
chmod 600 "$SSH_DIR/authorized_keys"
chown -R "$USER_NAME:$USER_NAME" "/home/$USER_NAME"

apt-get update -qq
apt-get install -y sudo

usermod -aG sudo "$USER_NAME"

if [ "$ENABLE_SUDO_NOPASSWD" = true ]; then
    echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USER_NAME"
    chmod 440 "/etc/sudoers.d/$USER_NAME"
fi


SSHD_CONFIG="/etc/ssh/sshd_config"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' $SSHD_CONFIG
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' $SSHD_CONFIG
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' $SSHD_CONFIG
sed -i 's/^#\?StrictModes.*/StrictModes yes/' $SSHD_CONFIG


systemctl restart sshd

curl -fsSL https://raw.githubusercontent.com/wxdxcx/xx/refs/heads/main/dd.sh | bash
