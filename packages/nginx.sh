#! /bin/bash

CONFIG_HOME=$PWD
NGINX_SOURCE_URL=http://nginx.org/download/nginx-1.0.11.tar.gz
NGINX_SOURCE_DIR=nginx-1.0.11

cd /tmp/
wget $NGINX_SOURCE_URL -O nginx.tar.gz
tar xvf nginx.tar.gz
cd $NGINX_SOURCE_DIR

./configure --prefix=/opt/nginx --conf-path=/opt/nginx/conf/nginx.conf --with-http_gzip_static_module && make && make install

cd /opt/nginx/conf
mkdir {conf.d,defaults,sites-enabled}
mv *.default defaults/
cp $CONFIG_HOME/nginx/nginx.conf .
cp $CONFIG_HOME/nginx/gzip_static.conf conf.d/

cp $CONFIG_HOME/nginx/nginx.init /etc/init.d/nginx
chmod +x /etc/init.d/nginx
update-rc.d nginx defaults
service nginx start

[[ $? -eq 0 ]] && echo "Done setting up Nginx"
exit $?
