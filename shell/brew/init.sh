#!/usr/bin/env zsh

# install brew cask
brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/bundle
brew tap homebrew/dupes
brew tap homebrew/php

brew install brew-cask

# 安装字体
brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2
brew tap homebrew/cask-fonts
# brew install --cask font-ubuntu-mono-nerd-font 
# brew install --cask font-fira-code-nerd-font

brew tap buo/cask-upgrade # Upgrade with `brew cu`

brew tap scullionw/tap
brew install dirstat-rs # 查看硬盘使用情况，类似 windirstat，速度更快

# Better console tools
brew install exa
brew install fd
brew install bat
brew install hyperfine
brew install procs
brew install sd
brew install duf
# Other utilities
brew install shfmt
brew install shellcheck
brew install tree
brew install p7zip
brew install jq
brew install direnv
brew install trash-cli 
brew install trash
brew install ninja
brew install pandoc 
brew install ffmpeg 
brew install iptraf
brew install collectl
brew install dstat
brew install iostat
brew install iotop
brew install sar
brew install saidar
brew install vmstat
brew install duti
brew install gmp
brew install coreutils # Install GNU core utilities (those that come with OS X are outdated)
brew install moreutils # Install some other useful utilities like `sponge`.
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install gnupg # Install GnuPG to enable PGP-signing commits.
brew install gnupg2
brew install eva # alternative bc, calculator
brew install btop # better top, 代替 htop，代替 top
brew install grep
brew install ripgrep
brew install awscli
brew install ctags

# ssh
brew install mosh
brew install ssh-copy-id # 自带
brew install openssl

# net
brew install wget
brew install curl
brew install neofetch
brew install rsync
brew install httpie
brew install net-tools
brew install bandwhich # network monitor

# shell
brew install zsh
brew install screen
brew install bash # Install Bash 4
brew install bash-completion2

# cvs
brew install git
brew install mercurial
brew install hub
brew install gh

# lang
brew install ruby
brew install node
brew install go
brew install python
brew install python3
brew install lua
brew install R
brew install llvm
brew install gcc 
brew install gdb
brew install cmake
brew install android-platform-tools

# lint
brew install pre-commit
brew install prettier 
brew install cppcheck
brew install cpplint

# services
brew install mariadb # mysql

# brew install gnu-sed --with-default-names
# brew install vim --with-override-system-vi
# brew install php56, args: ['with-debug', 'without-apache'] # 换新版
# brew install php70, args: ['with-debug', 'without-apache']

# brew install mackup # osx 配置管理器，换 dotbot
# brew install antigen # zsh 包管理器，换 zinit
# brew install mysql # 换 mariadb
# brew install autojump # 换 z
# brew install zgenom # 用 zinit 代替
# brew install mackup # 用 dotbot 代替

# 清理
brew cleanup
brew cask cleanup
