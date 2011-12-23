#! /bin/bash

VIM_SOURCE_URL=ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
VIM_SOURCE_DIR=vim73

cd /tmp/
wget $VIM_SOURCE_URL -O vim.tar.bz2
tar xvf vim.tar.bz2
cd $VIM_SOURCE_DIR
./configure --prefix=/usr --disable-darwin --disable-selinux --enable-pythoninterp=yes --disable-netbeans --enable-multibyte --disable-gtktest --disable-gpm --disable-nls --with-features=huge 
make -j NUM_OF_CORES
make install

[[ $? -eq 0 ]] && echo "Done setting up Vim"
exit $?
