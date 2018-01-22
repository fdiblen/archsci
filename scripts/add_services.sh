#!/bin/zsh

cd /home/archsci/temp/services
for serviceFile in $(ls)
do
    echo "Seeting up the service:" $serviceFile
    echo "" >> /etc/supervisor/conf.d/supervisord.conf
    cat $serviceFile >> /etc/supervisor/conf.d/supervisord.conf
done


# SSH
#=========================================
#/usr/bin/ssh-keygen -A

sed -i "s/GSSAPIAuthentication yes/GSSAPIAuthentication no/" /etc/ssh/sshd_config
ssh-keygen -q -t dsa -f /root/.ssh/id_dsa -N '' -C 'key generated with docker'
cat /root/.ssh/id_dsa.pub > /root/.ssh/authorized_keys

#echo "export VISIBLE=now" >> /etc/profile

sudo -H -u archsci bash -c '/home/archsci/temp/scripts/setup_ssh.sh'
sudo -H -u root bash -c '/home/archsci/temp/scripts/setup_ssh.sh'

cp ~/.ssh/id_rsa /etc/ssh/ssh_host_rsa_key
cp  /root/.ssh/id_dsa /etc/ssh/ssh_host_dsa_key

cat /root/.ssh/id_dsa.pub >> /home/archsci/.ssh/authorized_keys
cat /home/archsci/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
