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


mkdir -p /var/www/candidateeval/public_html
chown -R $USER:$USER /var/www/candidateeval/public_html
chmod -R 755 /var/www
echo "<html><body><h1>Welcome</h1>" > /var/www/index.html
echo "I was generated from user-data and cloud-init" >> /var/www/index.html
echo "</body></html>" >> /var/www/index.html
cp /etc/apache2/sites-available/default /etc/apache2/sites-available/candidateeval
#
# Load candidateeval virtual site and restart service - keep it simple
#
a2ensite candidateeval
service apache2 reload