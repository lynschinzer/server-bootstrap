#! /bin/bash

CONFIG_DIR="`readlink -f $0 | xargs dirname`/config"

function copy_config_to_home {
    local dest="/home/$1"

    for i in `ls $CONFIG_DIR`
    do
        cp $CONFIG_DIR/$i "$dest/.$i"
    done
}

USERNAME=$1

if [ -z $USERNAME ]
then
    echo "no username specified"
    exit 1
fi

useradd -m -G sudo -s `which bash` $USERNAME

echo "Set password for user '$USERNAME'"
passwd $USERNAME

copy_config_to_home $USERNAME

exit $?
