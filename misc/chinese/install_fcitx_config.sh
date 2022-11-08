#!/usr/bin/env zsh

# rm -rf $XDG_CONFIG_HOME/fcitx $XDG_CONFIG_HOME/fcitx5 $XDG_DATA_HOME/fcitx5 $XDG_CONFIG_HOME/fcitx/emacs-rime/

mkdir -p $XDG_CONFIG_HOME/fcitx/rime

# Download zhwiki pinyin dictionary
if [[ ! -f $XDG_CONFIG_HOME/fcitx/rime/zhwiki.dict.yaml ]]; then
  [[ ! -f $WGETRC ]] && touch $WGETRC
  wget --no-check-certificate $(get_github_latest_release_url felixonmars/fcitx5-pinyin-zhwiki "\.dict\.yaml") \
    -O $XDG_CONFIG_HOME/fcitx/rime/zhwiki.dict.yaml
fi

# 1. System input method

ln -s -f $DOTTY_CONFIG_HOME/misc/chinese/config/fcitx/config $XDG_CONFIG_HOME/fcitx/config
ln -s -f $DOTTY_CONFIG_HOME/misc/chinese/config/rime/* $XDG_CONFIG_HOME/fcitx/rime/
ln -s -f $DOTTY_CONFIG_HOME/misc/chinese/.pam_environment ${HOME}/.pam_environment

[[ -d ${DOTTY_ASSETS_HOME}/rime-dictionaries ]] && ln -s -f $DOTTY_ASSETS_HOME/rime-dictionaries/*.dict.yaml $XDG_CONFIG_HOME/fcitx/rime/

case $(_os) in
  macos)
    rm -rf ~/Library/Rime
    ln -s -f ~/.config/fcitx/rime ~/Library/Rime

    # Install emoji
    mkdir -p /tmp/fcitx-install
    (
      cd /tmp/fcitx-install
      curl -fsSL https://git.io/rime-install | bash -s -- emoji
    )
    rm -rf /tmp/fcitx-install
    ;;
esac

# 2. Emacs input method

# Don't use $XDG_CONFIG_HOME/fcitx/rime as your emacs fcitx config dir. It will cause conflict.
mkdir -p $XDG_CONFIG_HOME/fcitx/emacs-rime/
ln -s -f $DOTTY_CONFIG_HOME/misc/chinese/config/rime/* $XDG_CONFIG_HOME/fcitx/emacs-rime/
[[ -d $DOTTY_ASSETS_HOME/rime-dictionaries ]] && ln -s -f $DOTTY_ASSETS_HOME/rime-dictionaries/*.dict.yaml $XDG_CONFIG_HOME/fcitx/emacs-rime/

# opencc, emoji_suggestion.yaml exists in macos
local link_files=("opencc" "emoji_suggestion.yaml" "zhwiki.dict.yaml")
for file in ${link_files[@]}; do
  if [[ -f ${XDG_CONFIG_HOME}/fcitx/rime/$file ]]; then
    ln -s -f ${XDG_CONFIG_HOME}/fcitx/rime/$file $XDG_CONFIG_HOME/fcitx/emacs-rime/
  fi
done
