export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_BIN_HOME=~/.local/bin
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

# bare rope 管理 dotfiles
# CONFIG_PATH=$HOME/.dfh
# alias dfh="/usr/bin/git --git-dir $CONFIG_PATH --work-tree=$HOME"
# dfh config --local status.showUntrackedFiles no
# git clone --bare <git_url> $HOME/.dfh

backup_dfh() {
  mkdir -p ~/dotfiles_backup && \
  dfm checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} ~/dotfiles_backup/{}
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

# Created by mirror-config-china
export IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODIST_IOJS_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVM_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NVMW_IOJS_ORG_MIRROR=https://npm.taobao.org/mirrors/iojs
export NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NODIST_NODE_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVMW_NPM_MIRROR=https://npm.taobao.org/mirrors/npm

# RANCHER DESKTOP
# export PATH="/Users/eqielb/.rd/bin:$PATH"
