export ZSH_CONFIG_PATH=~/.local/share/dotfiles/shell/zsh/
source ${ZSH_CONFIG_PATH}/p10k.zsh;
source ${ZSH_CONFIG_PATH}/options/functions.zsh;
source ${ZSH_CONFIG_PATH}/options/options.zsh;
source ${ZSH_CONFIG_PATH}/options/keybindings.zsh;
source ${ZSH_CONFIG_PATH}/options/completion.zsh;
source ${ZSH_CONFIG_PATH}/options/aliases.zsh;
source ${ZSH_CONFIG_PATH}/options/proxy.zsh;
source ${ZSH_CONFIG_PATH}/iterm2_shell_integration.zsh;
source ${ZSH_CONFIG_PATH}/jetbrains.vmoptions.zsh
source ~/.config/tabtab/zsh/__tabtab.zsh

# 测量启动时间
# time zsh -i -c exit

# Modern Unix commands
# See https://github.com/ibraheemdev/modern-unix
# brew install tmux vim  
# brew install jq exa svn rg fd vim fzf asdf
# brew install ripgrep bat z.lua

# 参考
# ogham/exa @sharkdp/fd @sharkdp/hyperfine ClementTsang/bottom cheat/cheat dandavison/delta 
# muesli/duf bootandy/dust orf/gping dalance/procs
# junegunn/fzf Aloxaf/fzf-tab fzf-git

CONFIG_PATH=$HOME/.dfh
alias dfh="/usr/bin/git --git-dir $CONFIG_PATH --work-tree=$HOME"
# dfh config --local status.showUntrackedFiles no
# git clone --bare <git_url> $HOME/.dfh

backup_dfh() {
  mkdir -p ~/dotfiles_backup && \
  dfm checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} ~/dotfiles_backup/{}
}

# language, Prefer US English and use UTF-8.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

###############################################################################
# Functions
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
_fn() { 
  ls **/*$1* 
}
_has() {
  return $( whence $1 &>/dev/null )
}
_try() {
  return $( eval $* &>/dev/null )
}
_versionof() {
  if _has "$1"; then
    echo "$1 $($1 --version)"
  else
    echo "$1 n/a"
  fi
}

###############################################################################

# Make vim the default editor.
export BUNDLER_EDITOR='code'
export EDITOR='vim';

# electron
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

# brew
export PATH="/usr/local/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export HOMEBREW_GITHUB_API_TOKEN=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
export HOMEBREW_HOME=/usr/local/bin
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export PYCURL_SSL_LIBRARY=openssl

# node
export NODE_PATH=/usr/local/lib/node_modules
export NODE_TLS_REJECT_UNAUTHORIZED=1
export N_PRESERVE_NPM=1 # 当切换 Node.js 版本时保留 npm

export NODE_REPL_HISTORY=~/.cache/.node_history; # Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY_SIZE='32768'; # Allow 32³ entries; the default is 1000.
export NODE_REPL_MODE='sloppy'; # Use sloppy mode by default, matching web browsers.

# bun
[ -s "/Users/eqielb/.local/share/bun/_bun" ] && source "/Users/eqielb/.local/share/bun/_bun"
export BUN_INSTALL="/Users/eqielb/.local/share/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/usr/local/lib/pnpm"
export PATH="$PNPM_HOME:$PATH"

# java
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$PATH:$JAVA_HOME/bin"

# jdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# python
export PYTHON_HOME="/usr/local/miniconda3/bin"
export PATH="$PYTHON_HOME:$PATH"
export PYTHONIOENCODING="UTF-8" # Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
# export PATH="/usr/local/opt/python@3.10/bin:$PATH"
# python2
# export PYENV_ROOR="$HOME/.pyenv"
# export PATH="$(pyenv root)/shims:${PATH}"

# ruby
export RUBY_HOME="$(brew --prefix ruby)"
export PATH="$RUBY_HOME/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export LDFLAGS="-L$RUBY_HOME/lib"
export CPPFLAGS="-I$RUBY_HOME/include"
export PKG_CONFIG_PATH="$RUBY/lib/pkgconfig"

# go
export GOPATH="/usr/local/lib/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
#test -d "$GOPATH" || mkdir "$GOPATH"
#test -d "$GOPATH/src/github.com" || mkdir -p "$GOPATH/src/github.com"
#go env -w GO111MODULE=on
#go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
# export GOPROXY=https://goproxy.io

# php
export COMPOSER_HOME="/usr/local/lib/composer"
export PATH=$COMPOSER_HOME/vendor/bin:$PATH
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# flutter
# export PUB_HOSTED_URL=https://pub.flutter-io.cn
# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# docker
export DOCKER_HOST=tcp://192.168.68.2:2376 
export DOCKER_TLS_VERIFY=1

# k8s
export PATH="${PATH}:${HOME}/.krew/bin"
alias kube='kubectl --insecure-skip-tls-verify'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# depot_tools
# export DEPOT_TOOL_DIR=/usr/local/Custom/depot_tools
# export PATH=$DEPOT_TOOL_DIR:$PATH

# qt
# export PATH="/usr/local/opt/qt/bin:$PATH"

# texinfo
# export PATH="/usr/local/opt/texinfo/bin:$PATH"

# ansible
export ANSIBLE_HOST_KEY_CHECKING=False



##############################
# custom alias 
#!/usr/bin/env bash


# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

#
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"


# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
