#!/usr/bin/env zsh

if [[ ! -d $DOTTY_CONFIG_HOME ]]; then
  echo-fail "You haven't clone private assets repo, please clone ztlevi/dotty-assets first."
  echo-fail "Install Typora theme failed."
fi

case $(_os) in
    macos)
      local typora_theme_dir="$HOME/Library/Application Support/abnerworks.Typora/themes/"
      ;;
esac

if [[ -n "$typora_theme_dir" ]]; then
  cp -f $DOTTY_ASSETS_HOME/typora-themes/* "$typora_theme_dir"
fi

echo-ok "Install Typora theme successfully."
