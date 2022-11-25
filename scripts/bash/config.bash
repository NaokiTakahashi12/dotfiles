# OS
if [ 'Darwin' == "$(uname)" ]
then
    set -o emacs
fi
# Homebrew
if [ -f /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]
then
    eval "$(/usr/local/bin/brew shellenv)"
fi
if type "brew" > /dev/null 2>&1
then
    export PATH="$PATH:$(brew --prefix)/bin"
    export PATH="$PATH:$(brew --prefix)//Cellar/cython/0.29.32*/bin"
    export PATH="$PATH:$(brew --prefix)/opt/qt@5/bin"
    export LDFLAGS="$LDFLAGS -L$(brew --prefix)/opt/qt@5/lib"
    export CPPFLAGS="$CPPFLAGS:-I$(brew --prefix)/opt/qt@5/include"
    export PKG_CONFIG_PATH="$(brew --prefix)/opt/qt@5/lib/pkgconfig"
    export OPENSSL_ROOT_DIR="$(brew --prefix)/opt/openssl"
fi
# Rust
if [ -f $HOME/.cargo/env ]
then
    source "$HOME/.cargo/env"
elif [ -d $HOME/.cargo/bin ]
then
    export PATH="$PATH:${HOME}/.cargo/bin"
fi
# local binary files
if [ -d "$HOME/.local/bin" ]
then
    export PATH="$PATH:${HOME}/.local/bin"
fi
if [ -d "$HOME/.local/lib" ]
then
    export LDFLAGS="$LDFLAGS -L$HOME/.local/lib"
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/.local/lib"
fi
# PS
if [ $UID -eq 0 ]; then
	PS1="\[\e[1;31m\]\u\[\e[37m\]@\[\e[m\]\h\[\e[m\]:\[\e[37m\]\w\[\e[m\]\n \[\e[31m\]⬧\[\e[36m\]❯\[\e[35m\]❯\[\e[m\] "
else
	PS1="\[\e[1;m\]\u\[\e[37m\]@\[\e[m\]\h\[\e[m\]:\[\e[37m\]\w\[\e[m\]\n \[\e[31m\]⬧\[\e[36m\]❯\[\e[35m\]❯\[\e[m\] "
fi
# fzf
if type "fzf" > /dev/null 2>&1
then
    export FZF_DEFAULT_OPTS='--height 40% --border'
    export FZF_COMPLETION_OPTS='+c -x'
    export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style={header,grid} --line-range :100 {}"'
fi
# Starship
if type "starship" > /dev/null 2>&1
then
    eval "$(starship init bash)"
fi
# fuck
if type "thefuck" > /dev/null 2>&1
then
    eval "$(thefuck --alias)"
fi
# Zoxide
if type "zoxide" > /dev/null 2>&1
then
    eval "$(zoxide init bash)"
fi
