if [ -x /usr/bin/dircolors ]
then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias l='ls -CF'
alias la='ls -a'
alias j='jobs'
alias tt='tree -ph'
alias grep='grep --color=auto'
alias m='make -j4'
alias n='ninja -j4'
alias b='cmake --build .'

alias remake='make clean && make'
alias timestamp='date +%Y%m%d%H%M%S'
alias reload_bashrc='source ~/.bashrc'

# Homebrew
if type "brew" > /dev/null 2>&1
then
    alias bi='brew info'
fi
# bat
if type "bat" > /dev/null 2>&1
then
    alias cat="bat --style=grid"
fi
# translate cli
if type "trans" > /dev/null 2>&1
then
    alias enjp='trans en:ja'
    alias jpen='trans ja:en'
fi
# ls alternate
if type "exa" > /dev/null 2>&1
then
    alias ll='exa -lhabgHmu --git'
else
    alias ll='ls -la'
fi
# command line shortcuts ex) Ctrl-a
if type "system_profiler" > /dev/null 2>&1
then
    alias lsusb='system_profiler SPUSBDataType'
fi
# vim
if type "nvim" > /dev/null 2>&1
then
    alias vi='nvim'
elif type "vim" > /dev/null 2>&1
then
    alias vi='vim'
fi
# tmux
if type "tmux" > /dev/null 2>&1
then
    alias t='tmux'
    alias ta='tmux attach -t'
fi
# fzf
if type "fzf" > /dev/null 2>&1
then
    alias ff='fzf --preview "bat  --color=always --style={header,grid} --line-range :150 {}"'
    alias fvi='vim $(ff)'
    alias fcat='fcat $(ff)'
    alias fcd='cd `find * -type d | fzf`'
fi
# rsync
if type "rsync" > /dev/null 2>&1
then
    alias rsync='rsync --progress --exclude-from=${HOME}/.config/rsync'
fi
if type "ip" > /dev/null 2>&1
then
    alias ip='ip -c'
fi
