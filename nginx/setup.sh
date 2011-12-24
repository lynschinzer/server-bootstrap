#! /bin/bash

CONFIG_DIR=`readlink -f $0 | xargs dirname`
NGINX_SOURCE_URL=http://nginx.org/download/nginx-1.0.11.tar.gz
NGINX_SOURCE_DIR=nginx-1.0.11
NGINX_CONF_DIR=/opt/nginx/conf

cd /tmp/
wget $NGINX_SOURCE_URL -O nginx.tar.gz
tar xvf nginx.tar.gz
cd $NGINX_SOURCE_DIR

./configure --prefix=/opt/nginx --conf-path=$NGINX_CONF_DIR/nginx.conf --with-http_gzip_static_module
make -j $NUM_OF_CORES
make install

adduser --system --no-create-home --disabled-login --disabled-password --group nginx

cd $NGINX_CONF_DIR

mkdir {conf.d,defaults,sites-enabled}
mv *.default defaults/

cp $CONFIG_DIR/nginx.conf .
cp $CONFIG_DIR/gzip_static.conf conf.d/

chmod 775 $NGINX_CONF_DIR -R
chown nginx:admin $NGINX_CONF_DIR -R

cp $CONFIG_DIR/nginx.init /etc/init.d/nginx
chmod +x /etc/init.d/nginx
update-rc.d nginx defaults

service nginx start

[[ $? -eq 0 ]] && echo "Done setting up Nginx"
exit $?
