systemctl stop firewalld
rpm -qa|grep ssh
mkdir -p /data/sftp
chmod 701 /data
groupadd sftpusers
useradd -g sftpusers -d /upload -s /sbin/nologin nisha
passwd nisha
mkdir -p /data/nisha/upload
chown -R root:sftpusers /data/nisha
chown -R nisha:sftpusers /data/nisha/upload
cat /etc/passwd|grep nisha
vim /etc/ssh/sshd_config

#add below mentioned 3 lines at the end of /etc/ssh/sshd_config
Match Group sftpusers
ChrootDirectory /data/%u
ForceCommand internal-sftp





service sshd restart
yum install nmap -y

nmap -n 35.200.187.64
sftp nisha@35.200.187.64