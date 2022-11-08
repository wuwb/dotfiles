#!/usr/bin/env zsh

source $DOTTY_CONFIG_HOME/env

tempdir=/tmp/temp-install
mkdir -p $tempdir

# Flat-remix Theme
cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'daniruiz/flat-remix-gtk') -O flat-remix-gtk.tar.gz
tar -zxvf flat-remix-gtk.tar.gz
mkdir -p ~/.themes && cp -r flat-remix-gtk-*/themes/Flat-Remix-GTK-Blue-Light ~/.themes
rm -rf $tempdir/flat-remix-gtk*

cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'daniruiz/flat-remix-gnome') -O flat-remix-gnome.tar.gz
tar -zxvf flat-remix-gnome.tar.gz
mkdir -p ~/.themes && cp -r flat-remix-gnome-*/themes/Flat-Remix-Blue-Light ~/.themes
rm -rf $tempdir/flat-remix-gnome*

cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'daniruiz/flat-remix') -O flat-remix.tar.gz
tar -zxvf flat-remix.tar.gz
mkdir -p ~/.icons && cp -r flat-remix-*/Flat-Remix-Blue-Light ~/.icons
rm -rf $tempdir/flat-remix*

gsettings set org.gnome.desktop.interface gtk-theme 'Flat-Remix-GTK-Blue-Light'
gsettings set org.gnome.shell.extensions.user-theme name 'Flat-Remix-Blue-Light'
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Blue-Light"

rm -rf $tempdir
