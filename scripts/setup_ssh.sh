#!/bin/sh

mkdir -p ~/.ssh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
#cp ~/.ssh/id_rsa /etc/ssh/ssh_host_rsa_key
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/id*
# chmod 644 ~/.ssh/id*.pub
# chmod 644 ~/.ssh/authorized_keys
# chmod 644 ~/.ssh/known_hosts


echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "Match User root" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config


echo "RSAAuthentication yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config


echo "Host *" >> ~/.ssh/config
echo "    StrictHostKeyChecking no" >> ~/.ssh/config
chmod 400 ~/.ssh/config

