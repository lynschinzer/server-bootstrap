#! /bin/bash

CONFIG_DIR=`readlink -f $0 | xargs dirname`

cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0 /etc/openvpn/easyrsa
cd /etc/openvpn/easyrsa

source ./vars
./clean-all
./build-ca

./build-key-server server
./build-dh

read -p "Enter your client key name:" CLIENTNAME
echo ""
./build-key $CLIENTNAME

cp keys/{ca.crt,ca.key,dh1024.pem,server.crt,server.key} /etc/openvpn/

cd $CONFIG_DIR
cp server.conf /etc/openvpn

sysctl -w net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

bash iptables.sh
cat iptables.sh >> /etc/rc.local
