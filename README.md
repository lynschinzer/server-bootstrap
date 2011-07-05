# Standard Server Configuration

Operations that need to be performed to build up a rails server.

## User

1. userdel all except root
1. passwd root with a complicated password
1. adduser and visudo
1. config ssh 
   ssh-keygen
   paste publickey into ~/.ssh/authorized_keys
   chmod 700 ~/.ssh && chmod 600 ~/.ssh/*

## Tools

1. ``sudo apt-get install vim git-core``
2. ``git clone http://github.com/iwinux/rails_server_config``
3. ``ln -s`` files into ~/
4. ``git clone http://github.com/iwinux/vimrc`` and set up vim
5. ``sudo apt-get install build-essentials``

## Rails Stack

### I. Ruby

1. ``sudo apt-get install curl zlib1g zlib1g-dev libssl-dev libreadline5-dev libxml2-dev``
2. ``bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)``
3. ``rvm install 1.9.2 && rvm --default 1.9.2``

### II. Passenger and Nginx

1. ``rvm gemset create main && rvm gemset use main``
1. ``gem install passenger --no-rdoc --no-ri``
1. get source of nginx
1. configure & build with passenger-install-nginx-module:
    ``--conf-path=/home/winus/nginx/conf/nginx.conf --with-http_gzip_static_module``
1. ``ln -s`` config files into nginx/conf
1. ``sudo cp upstart.conf /etc/init/nginx.conf`` && ``sudo initctl start nginx``

### III. PostgreSQL

To be added soon...
