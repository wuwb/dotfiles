#!/usr/bin/env zsh

brew install gcc coreutils duti

brew tap buo/cask-upgrade # Upgrade with `brew cu`
# mac quicklook https://github.com/sindresorhus/quick-look-plugins
brew install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlvideo # suspicious-package apparency quicklookase

brew install --cask karabiner-elements monitorcontrol

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-ubuntu-mono-nerd-font font-fira-code-nerd-font

# Download app from anywhere
sudo spctl --master-disable
# Remove the Dock autohide animation
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# Enable ssh X11 forwarding. Disabled now due to the pool usability
# brew install --cask xquartz
# defaults write org.macosforge.xquartz.X11 enable_iglx -bool true

# Add some recommendation
echo-info "Recommended to set 'Remove items from the Trash after 30 days' in Finder->Preference->Advanced"
echo-info "Recommended to set 'Show all filename extensions' in Finder->Preference->Advanced"
echo-info "Recommended to set default view in Finder->View->Show View Options(CMD-j),
e.g. Always open in list view, group by kind, sort by name. Click 'Use as defaults'.
Close all finder windows. Then run \`sudo find / -name .DS_Store -delete &>/dev/null | echo; killall Finder\`"
