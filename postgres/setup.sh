#! /bin/bash

CONFIG_DIR=`readlink -f $0 | xargs dirname`
POSTGRESQL_DEB_URL=http://oscg-downloads.s3.amazonaws.com/packages/postgres_9.1.2-1.amd64.openscg.deb
POSTGRES_ROOT=/opt/postgres/9.1
POSTGRES_DATA=/data/postgres/data

if [[ -d $POSTGRES_DATA ]]
then
    echo "PostgreSQL already installed and initialized!"
    exit 1
fi

cd /tmp/
wget $POSTGRESQL_DEB_URL -O postgres.deb
dpkg -i postgres.deb

cd /etc/init.d
rm postgres-9.1-openscg
cp $CONFIG_DIR/postgres.init /etc/init.d/postgres
chmod +x /etc/init.d/postgres
update-rc.d postgres defaults

mkdir -p $POSTGRES_DATA

groupadd postgres
useradd -m -c "PostgreSQL" -s /bin/bash -d $POSTGRES_DATA -g postgres postgres
echo 'Setting password for user postgres...'
passwd postgres

chown -R postgres:postgres $POSTGRES_DATA

su - postgres -c "LD_LIBRARY_PATH=$POSTGRES_ROOT/lib:$LD_LIBRARY_PATH $POSTGRES_ROOT/bin/initdb  -E utf8 -A md5 -D $POSTGRES_DATA -U postgres -W"

cp $CONFIG_DIR/postgresql.conf $POSTGRES_DATA
cp $CONFIG_DIR/bash_profile $POSTGRES_DATA/.bash_profile
mkdir $POSTGRES_DATA/pg_log
chown -R postgres:postgres $POSTGRES_DATA

service postgres start
