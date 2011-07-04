# If not running interactively, don't do anything
if [ -n "$PS1" ]; then
    complete -cf sudo

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # enable bash completion in interactive shells
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

    # if the command-not-found package is installed, use it
    if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
        function command_not_found_handle {
                # check because c-n-f could've been removed in the meantime
                    if [ -x /usr/lib/command-not-found ]; then
               /usr/bin/python /usr/lib/command-not-found -- $1
                       return $?
                    elif [ -x /usr/share/command-not-found ]; then
               /usr/bin/python /usr/share/command-not-found -- $1
                       return $?
            else
               return 127
            fi
        }
    fi

    D=$'\e[37;40m'
    PINK=$'\e[35;40m'
    GREEN=$'\e[32;40m'
    ORANGE=$'\e[33;40m'

    function parse_git_dirty {
      [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
    }
    function parse_git_branch {
      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
    }

    export PS1='\n${PINK}\u ${D}at ${ORANGE}\h ${D}in ${GREEN}\w${D}$(parse_git_branch)\n$ '

    # Make bash append rather than overwrite the history on disk
    shopt -s histappend
    export HISTCONTROL=ignoreboth
    export HISTSIZE=5000

    # Default to human readable figures
    alias df='df -h'
    alias du='du -h'
    alias grep='grep --color'
    alias ls='ls --color=auto'
    alias rm='rm -i'
    alias mv='mv -i'
    alias info='info --vi-keys'
    alias makexec='chmod +x'
    alias p='pgrep -fl'

    export RUBYOPT=rubygems
    export rvm_cd_complete_flag=1
    export rvm_pretty_print_flag=1
    export EDITOR=vim
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
#source ~/.local/bin/bashmarks.sh
