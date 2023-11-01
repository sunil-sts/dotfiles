#!/bin/zsh

# Environment file, sets environment variables for zsh
# This is always run, i.e. login shells and interactive shells

# Path
export PATH="$HOME/.local/bin:$HOME/.local/bin/statusbar:$PATH"

# Default programs
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export TERMINAL="st"
export BROWSER="librewolf"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# XDG User Directories
export XDG_DESKTOP_DIR="$HOME/downloads"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_TEMPLATES_DIR="$HOME/.local/templates"
export XDG_PUBLICSHARE_DIR="$HOME/.local/public"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_VIDEOS_DIR="$HOME/videos"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=10000000
export SAVEHIST=10000000
export Z_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# Shell
export SHELL="/bin/zsh"
export INPUTRC="$XDG_CONFIG_HOME/zsh/inputrc"

# X11
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$PATH:$CARGO_HOME/bin"

# Haskell
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal/config"
export CABAL_DIR="$XDG_DATA_HOME/cabal"
export GHCUP_INSTALL_BASE_PREFIX="$XDG_DATA_HOME"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export PATH="$PATH:$CABAL_DIR/bin:$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin"

# Go
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"

# GnuPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

# Tmux
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# gtk
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Mail 
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"

# wine
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Python
export JUPYTER_PLATFORM_DIRS="1"

# VsCode?
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"


# Program settings
export _JAVA_AWT_WM_NONREPARENTING=1 # Fix for Java applications in dwm
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2" # Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1" # Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D" # May have to install wmname

