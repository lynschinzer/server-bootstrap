#! /bin/bash

curl -kL http://xrl.us/pythonbrewinstall | bash
echo "[[ -s \$HOME/.pythonbrew/etc/bashrc ]] && source \$HOME/.pythonbrew/etc/bashrc" >> $HOME/.bashrc
source $HOME/.bashrc

pythonbrew install -n -j $NUM_OF_CORES 2.7.2
pythonbrew switch 2.7.2

[[ $? -eq 0 ]] && echo "Done setting up Python 2.7.2"
exit $?
