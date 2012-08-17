#! /bin/bash

apt-get install --yes build-essential zlib1g zlib1g-dev libsqlite3-dev libssl-dev libreadline6-dev libxml2-dev libpcre3-dev libcurl4-openssl-dev libncurses5-dev curl htop tree openvpn exuberant-ctags tmux

if [[ $? -eq 0 ]]
then
    echo "Done setting up dependencies."
    echo `date` > /var/cache/DEPS_INSTALLED
fi

exit $?
