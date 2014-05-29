#!/bin/sh
set -e -x

apt-get --yes --quiet update
apt-get --yes --quiet install puppet-common
apt-get upgrade -y
apt-get install apache2 -y

#
# Fetch puppet configuration from public github repository.
#

#mv /etc/puppet /etc/puppet.orig
#git clone https://github.com/mandadapunagesh/entrega.git /etc/puppet

#
# Run puppet, build site.
#
#puppet apply /etc/puppet/manifests/init.pp

sudo git clone https://github.com/mandadapunagesh/entrega.git /
sudo chown -R $USER:$USER /var/www/candidateeval/public_html
sudo chmod -R 755 /var/www

#
# Load candidateeval virtual site and restart service - keep it simple
#
sudo a2ensite candidateeval
sudo service apache2 reload