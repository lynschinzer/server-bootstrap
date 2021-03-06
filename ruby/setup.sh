#! /bin/bash

USERNAME=$1

if [ -z $USERNAME ]
then
    echo "no username specified"
    exit 1
fi

cp `readlink -f $0 | xargs dirname`/install.sh /tmp/install-ruby.sh
chmod 777 /tmp/install-ruby.sh
su - $USERNAME -c "NUM_OF_CORES=$NUM_OF_CORES /tmp/install-ruby.sh"
