source $DOTTY_CONFIG_HOME/wm/general/rc.zsh

if _is_callable xdg-open; then
  alias oo="xdg-open . >/dev/null &"
  alias soo="sudo xdg-open . >/dev/null &"
elif _is_callable xdg-open; then
  alias oo="gvfs-open . >/dev/null &"
  alias soo="sudo gvfs-open . >/dev/null &"
fi

# Dump all config: dconf dump / >~/Downloads/user.conf
dconf-dump-gnome() {
  dconf dump /org/gnome/ >$DOTTY_CONFIG_HOME/wm/gnome/dconf/gnome.conf
}

dconf-load-gnome() {
  # dconf reset -f /org/gnome/
  dconf load /org/gnome/ <$DOTTY_CONFIG_HOME/wm/gnome/dconf/gnome.conf
}
