#! /bin/bash

PKG_HOME=`basename $0`

function copy_to_home {
    local dest=$1
    shift

    for i in $@
    do
        cp $PKG_HOME/$i "$dest/.$i"
    done
}


groupadd dev

useradd -m deploy
echo "Set password for user 'deploy'"
passwd deploy
copy_to_home "/home/deploy" "bashrc" "gemrc" "gitconfig_deploy" "rvmrc"
mv /home/deploy/.gitconfig_deploy /home/deploy/.gitconfig

useradd -m -G dev,sudo,admin winus
echo "Set password for user 'winus'"
passwd winus
copy_to_home "/home/winus" "bashrc" "gitconfig_winus" "screenrc"
mv /home/winus/.gitconfig_winus /home/winus/.gitconfig

exit $?
