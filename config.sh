#!/bin/bash

# Create user 'douser' with passwordless sudo
useradd -m douser
usermod -aG wheel douser
echo "douser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/douser
chmod 440 /etc/sudoers.d/douser

# Set up SSH directory and public key
mkdir -p /home/douser/.ssh
touch /home/douser/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6i/mtv50wyrMim8J5sPB71HPrP10n04mSUmrtV9hX4vX9JPdRxt8EoEX8EVMwfm837fSHjIZ80ISK7jBA1yx3KAEneyscgkzRm19tniCs7qos5XVVMVXVSQmv2hg+1lzhPmiFlBtQ8/cRfmKX19m8C0Nd3wIxvxDyIEDyidpsUyQ/E2q/kq5YCftSEEB2HH2dZ2tl3aqi3NLWqT/pmLbelWTGo/ffZSiPiEmqqB1QOT6XwARDqiuFbVd4ZmXi0hCCMbMwYcyrtZblgoL1RINUvPdH8W3t6vntSZ6due0sijQJx4poXbg1SBckX1wff/k9LadHLyXkNB00xu6bZD+J douser@localhost.localdomain" > /home/douser/.ssh/authorized_keys
chown -R douser:douser /home/douser/.ssh
chmod 700 /home/douser/.ssh
chmod 600 /home/douser/.ssh/authorized_keys


# Install Ansible
amazon-linux-extras enable ansible2
yum install -y ansible
