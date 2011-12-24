#! /bin/bash

CONFIG_DIR=`readlink -f $0 | xargs dirname`
MONGODB_URL=http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.0.2.tgz
MONGODB_DIR=mongodb-linux-x86_64-2.0.2

cd /tmp

wget $MONGODB_URL -O mongodb.tgz
tar xvf mongodb.tgz -C /opt
mv /opt/$MONGODB_DIR /opt/mongodb

cd /opt/mongodb
cp $CONFIG_DIR/main.conf .
cp $CONFIG_DIR/{mongodb-start,mongodb-stop} bin/
chmod +x bin/{mongodb-start,mongodb-stop}

mkdir /data/mongodb -p
touch /data/mongodb.log

adduser --system --no-create-home --disabled-login --disabled-password --group mongodb
chown mongodb:mongodb -R {/data/mongodb,/data/mongodb.log}
chown mongodb:admin /opt/mongodb -R
chmod 775 /opt/mongodb -R

cp $CONFIG_DIR/mongodb.init /etc/init.d/mongodb
chmod +x /etc/init.d/mongodb
update-rc.d mongodb defaults

service mongodb start

[[ $? -eq 0 ]] && echo "Done setting up MongoDB"
exit $?
