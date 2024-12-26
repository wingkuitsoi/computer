# Configure passwordless authentication for the user set by command-line argument.
# Env: Ubuntu 20 Desktop

user=$1
if [ -z "$user" ]; then echo Error: user is empty. && exit 1; fi
echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$user
echo -e "[No password prompt]\nIdentity=unix-group:sudo\nAction=*\nResultActive=yes" | sudo tee /etc/polkit-1/localauthority/50-local.d/99-nopassword.pkla
