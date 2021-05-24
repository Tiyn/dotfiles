#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.local/bin` and all subdirectories to $PATH
export PATH="${PATH}:$(du "${HOME}/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="${HOME}/.nimble/bin:${PATH}"
export PATH="${HOME}/.pyenv/bin:${PATH}"
export PATH="${GOBIN}:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export BROWSER="firefox"
export RTV_BROWSER="qutebrowser"
export EDITOR="nvim"
export FILE="vifmrun"
export IMAGE="sxiv"
export READER="zathura"
export STATUSBAR="dwmblocks"
export TERMINAL="st"
export QT_QPA_PLATFORMTHEME="qt5ct"
export WINEPREFIX="${HOME}/.wine"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export ANDROID_SDK_HOME="${XDG_CONFIG_HOME}/android"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GOPATH="${HOME}/code/go"
export GOBIN="${GOPATH}/bin"
export GRADLE_USER_HOME="${XDG_CONFIG_HOME}/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0"
export HISTFILE="${XDG_CACHE_HOME}/shhistory"
export HISTSIZE=10000
export SAVEHIST=10000
export INPUTRC="${XDG_CONFIG_HOME}/inputrc"
export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"
export LESSHISTFILE="-"
export ncmpcpp_directory="-"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME}/notmuch-config"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NUGET_PACKAGES="${XDG_CACHE_HOME}/nugetpackages"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export SUDO_ASKPASS="${HOME}/.local/bin/tools/dmenupass"
export TMUX_TMPDIR="${XDG_CACHE_HOME}/tmux"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export _JAVA_AWT_WM_NONREPARENTING=1

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "${HOME}/.bashrc"
echo "$0" | grep "zsh$" >/dev/null && [ -f ${ZDOTDIR}/.zshrc ] && source "${ZDOTDIR}/.zshrc"

# Start graphical server if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
