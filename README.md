# Scripts that bootstrap your server with convenient configuration.

maintained by Limbo Peng (iwinux@gmail.com)

## Usage

1. SSH into root@remoteip
2. ``apt-get update && apt-get upgrade``
3. ``apt-get install git-core``
4. ``git clone http://github.com/iwinux/server-bootstrap``
5. ``cd server-bootstrap``
6. run ``./boostrap <packagename>`` to install the package

## Available packages

* deps: install dependencies - this should be run first
* mongodb: download and install MongoDB to /opt/mongodb (ATTENTION: it is for x64)
* nginx: build and install Nginx from source - it will be installed to /opt/nginx
* openvpn: install OpenVPN and set up the server
* python: install pythonbrew and build Python 2.7.2 from source via pythonbrew (installed to home directory of the specified user)
* ruby: install RVM and build Ruby 1.9.3 from source via RVM (installed to home directory of the specified user)
* user: create user with sudo priviledge and copy necessary config files
* vim: build and install Vim 7.3 from source
