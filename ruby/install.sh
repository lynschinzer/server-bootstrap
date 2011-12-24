#! /bin/bash

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo "[[ -r \$rvm_path/scripts/completion ]] && source \$rvm_path/scripts/completion" >> $HOME/.bashrc
source $HOME/.bashrc

rvm install 1.9.3 && rvm --default 1.9.3

[[ $? -eq 0 ]] && echo "Done setting up Ruby 1.9.3"
exit $?
