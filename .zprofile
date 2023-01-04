export HOSTNAME=$(cat /proc/sys/kernel/hostname)
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="/usr/local/cwb-3.4.30/bin:$PATH"
export PATH="$HOME/Scripts:$PATH"

export CORPUS_REGISTRY="$HOME/CWB/registry"

export FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden \
  -g "!{.git,node_modules,steamapps,vendor,undodir,Music,Games,USB,R.cpan,*.png,*.jpeg,*.jpg}/*"'

export TERMINAL="kitty"
export BROWSER="brave"
export READER="zathura"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="bat"
export BIB="$HOME/Nextcloud/templates/uni.bib"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export HISTCONTROL=ignoredups
# move some clutter out of home
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
#export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export TEXMFHOME="$HOME/.config/texmf"
export TEXMFVAR="$HOME/.config/texlive/texmf-var"
export TEXMFCONFIG="$HOME/.config/texlive/texmf-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export GOPATH="$HOME/.local/bin/go"
export GOMODCACHE="$HOME/.local/bin/go/pkg/mod"
export R_HISTFILE="~/.local/R/RHistory"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null
