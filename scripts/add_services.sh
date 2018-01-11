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
/usr/bin/ssh-keygen -A
# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
echo "export VISIBLE=now" >> /etc/profile
echo "export SHELL=/usr/bin/zsh" >> /etc/profile

sudo -H -u archsci bash -c '/home/archsci/temp/scripts/setup_ssh.sh'
sudo -H -u root bash -c '/home/archsci/temp/scripts/setup_ssh.sh'
