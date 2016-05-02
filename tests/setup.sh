#/bin/sh

# Completely remove mysql
#sudo apt-get remove -y --purge mysql-server mysql-client mysql-common
#sudo apt-get autoremove -y
#sudo apt-get autoclean
#sudo rm -rf /var/lib/mysql
#sudo rm -rf /root/.my.cnf

sudo apt-get install git python-setuptools python-dev python-pip python-crypto -yq
sudo apt-get install software-properties-common -yq
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
#curl https://raw.githubusercontent.com/ErgonLogicEnterprises/ansible-bootstrap/master/install-ansible.sh | /bin/sh
sudo ansible-galaxy install -r /vagrant/tests/requirements.yml
target=/etc/ansible/roles/ansible-role-aegir3drulenium
if [ ! -e $target ]; then
  mkdir -p /etc/ansible/roles
  ln -s /vagrant/ $target
fi
