# Install OpenSSH server in Debian-based Linux. 
# Configure password authentication and open port by passing command-line argument.

port=$1
apt update && apt upgrade
apt install openssh-server -y
echo -e '\nPasswordAuthentication yes\nPort $port\nListenAddress 0.0.0.0' >> /etc/ssh/sshd_config
# Alternative: service ssh restart
systemctl restart ssh
systemctl status ssh
