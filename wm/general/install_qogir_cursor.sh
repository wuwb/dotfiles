#!/usr/bin/env bash

tempdir=/tmp/temp-install
mkdir -p $tempdir

cd $tempdir
wget --no-check-certificate $(get_github_latest_release_url 'vinceliuice/Qogir-icon-theme') -O qogir-icon.tar.gz
tar -zxvf qogir-icon.tar.gz
mkdir -p ~/.icons
cp -r Qogir-icon-theme-*/src/cursors/dist ~/.icons/Qogir-cursors
cp -r Qogir-icon-theme-*/src/cursors/dist-dark ~/.icons/Qogir-white-cursors
rm -rf $tempdir/qogir-icon*

gsettings set org.gnome.desktop.interface cursor-theme 'xcursor-breeze-snow'

rm -rf $tempdir
