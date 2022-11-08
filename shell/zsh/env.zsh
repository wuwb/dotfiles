#!/usr/bin/env zsh
# env -- envvars & standard library for dotty; don't symlink me!
# Can be sourced by zsh/bash scripts

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_BIN_HOME=~/.local/bin

alias APT_INSTALL="sudo apt-get install -y --no-install-recommends --fix-missing"
alias PIP3_INSTALL="pip3 install --user --upgrade"

# echo helpers
function echo-debug  { }
function echo-info   { printf "\r\033[2K\033[0;34m[INFO]\033[0m %s\n" "$*"; }
function echo-info-b { echo ${fg[white]}${bg[blue]}"[INFO] $*"${reset_color} }
function echo-skip   { printf "\r\033[2K\033[38;05;240m[SKIP]\033[0m %s\n" "$*"; }
function echo-skip-b { echo ${fg[white]}${bg[black]}"[INFO] $*"${reset_color} }
function echo-ok     { printf "\r\033[2K\033[0;32m[ OK ]\033[0m %s\n" "$*"; }
function echo-ok-b   { echo ${fg[white]}${bg[green]}"[INFO] $*"${reset_color} }
function echo-fail   { printf "\r\033[2K\033[0;31m[FAIL]\033[0m %s\n" "$*"; }
function echo-fail-b { echo ${fg[white]}${bg[red]}"[INFO] $*"${reset_color} }

function dotty(){
}

local SEP='.'
function topic-enabled-p { [[ -L "$(topic-path $1)" ]] }

## Library
function _is_interactive() { [[ $- == *i* || -n $EMACS ]]; }

function _is_running() {
  for prc in "$@"; do
    pgrep -x "$prc" >/dev/null || return 1
  done
}

function _is_callable() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null || return 1
  done
}

function _run() {
  if _is_callable "$1" && ! _is_running "$1"; then
    "$@"
  fi
}

function _call() {
  if _is_callable "$1"; then
    "$@"
  fi
}

function _source() {
  [[ -f $1 ]] && source "$1"
}

function _load() {
}

function _load_repo() {
  _ensure_repo "$1" "$2" && source "$2/$3" || echo >&2 "Failed to load $1"
}

function _ensure_repo() {
  local target=$1
  local dest=$2
  if [[ ! -d $dest ]]; then
    if [[ $target =~ "^[^/]+/[^/]+$" ]]; then
      url=https://github.com/$target
    elif [[ $target =~ "^[^/]+$" ]]; then
      url=git@github.com:$USER/$target.git
    fi
    [[ -n ${dest%/*} ]] && mkdir -p ${dest%/*}
    git clone --recursive --depth 1 "$url" "$dest" || return 1
  else
    git -C $dest pull
  fi
}

function _os() {
  case $OSTYPE in
    linux*)
      if [[ -f /etc/nix/nix.conf ]]; then
        echo linux-nixos
      elif [[ -f /etc/arch-release ]]; then
        echo linux-arch
      elif [[ -f /etc/debian_version ]]; then
        echo linux-debian
      elif [[ -f /etc/yum.conf ]]; then
        echo linux-RHEL
      else
        echo linux-gnu
      fi ;;
    darwin*) echo macos ;;
    cygwin*) echo cygwin ;;
  esac
}

function _cache() {
  command -v "$2" >/dev/null || return 1
  local cache_dir="$XDG_CACHE_HOME/${SHELL##*/}"
  local cache="$cache_dir/$1"
  if [[ ! -f $cache || ! -s $cache ]]; then
    echo "Caching $1"
    mkdir -p $cache_dir
    "${@:2}" >$cache
  fi
  source $cache || rm -f $cache
}

function _cache_clear() {
  command rm -rf $XDG_CACHE_HOME/${SHELL##*/}
}

function get_github_latest_release_url() {
  # Function "get_github_latest_release_url": get repo's latest release download url
  # Requirement: jq needs to be installed

  # first argument: USER/REPO
  # second argument (optional): some repo's release has many assets targeting different platform. In this case,
  #   the file extension is needed to identify the asset you want.
  #   This argument is used as a regex. For example, you can either use "deb" or "\.deb" or ".*linux.*\.deb.
  # Example:
  # get_github_latest_release_url "wagoodman/dive" "\.deb"

  _callable() { command -v "$1" >/dev/null || return 1; }
  if ! _callable jq; then
    echo "jq is not found. Please install jq first."
    return 1
  fi

  # This token is generated in my dummy github account, but it has access to public repo
  local token1=ghp_SGiFgAhlUlVwp7dU
  local token2=dbWHGjFD3C2gOW3ZzIaT
  oauth_token=$token1$token2
  local url

  local repo=$1
  local regex=$2

  if [ -z "${repo}" ]; then
    echo "No USER/REPO defined, please use something like get_github_latest_release_url \"jgm/pandoc\"."
    return 1
  fi

  local assets
  assets=$(curl -H "Authorization: token ${oauth_token}" \
    --silent "https://api.github.com/repos/$repo/releases/latest" | jq -r ".assets")

  # Try release API
  if [[ "${assets}" != "null" ]] && [[ "${assets}" != "[]" ]]; then
    if [ -z "${regex}" ]; then
      url=$(echo "${assets}" | jq -r ".[0].browser_download_url")
    else
      local found=false
      for row in $(echo "${assets}" | jq -r ".[] | @base64"); do
        _jq() {
          echo "${row}" | base64 --decode | jq -r "${1}"
        }
        url=$(_jq ".browser_download_url")
        if echo "${url}" | rg -qe "${regex}$"; then
          found=true
          break
        fi
      done

      if ! "${found}"; then
        echo "Cannot find ${repo} release's assets with ${regex} as regex."
        return 1
      fi
    fi
  # Fallback to tag API
  else
    regex=${regex:-"tar.gz"}
    local version
    version=$(curl -H "Authorization: token ${oauth_token}" \
      --silent "https://api.github.com/repos/$repo/tags" | jq -r ".[0].name")
    if [[ -n "${version}" ]]; then
      local url=https://github.com/$repo/archive/$version.${regex}
    fi
  fi

  if [[ "$url" != "null" ]]; then
    echo "$url"
    return 0
  fi

  echo "Cannot find specifided $repo, please fix the USER/REPO name."
  return 1
}



# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export EDITOR=vim
#export TERM="screen-256color"

export NODE_HOME=/usr/local/node-v6.11.4-linux-64/
export PATH="$NODE_HOME/bin/:$PATH"

if [[ -d $HOME/phabricator/ ]]; then
	export PATH="$PATH:$HOME/phabricator/arcanist/bin/"
fi

case $OSTYPE in
	darwin*)
		export ANDROID_HOME="$HOME/Library/Android/sdk"
	;;
	linux*)
		export ANDROID_HOME="$HOME/Android/Sdk"
	;;
esac

export PATH="$PATH:$ANDROID_HOME/bin/"

export GOKU_EDN_CONFIG_FILE="$HOME/dotfiles/karabiner/karabiner.edn"

export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
# eval "$(zoxide init zsh)"


if [[ -d $HOME/.pyenv ]]; then
    # pyenv
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	if command -v pyenv 1>/dev/null 2>&1; then
		eval "$(pyenv init -)"
		# eval "$(pyenv init --path)"
		eval "$(pyenv virtualenv-init -)"
	fi
fi

if [[ -d $HOME/.poetry ]]; then
	# poetry
	export POETRY_ROOT="$HOME/.poetry/bin"
	export PATH="$POETRY_ROOT:$PATH"
fi

if [[ -d /home/linuxbrew/.linuxbrew ]]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [[ -d $HOME/flutter ]]; then
	export PATH="$PATH:$HOME/flutter/flutter_sdk/bin"
fi

# if [[ -d ~/.jenv ]]; then
#     # jenv
#     export PATH="$HOME/.jenv/bin:$PATH"
#     eval "$(jenv init -)"
# fi

# JDK
if [[ -d "/usr/local/jdk1.8.0_131" ]]; then
    export JAVA_HOME=/usr/local/jdk1.8.0_131
    export PATH=$PATH:$JAVA_HOME/bin/
fi
if [[ -d "$HOME/.asdf/installs/java/adoptopenjdk-8.0.265+1/" ]]; then
	export JAVA_HOME=$HOME/.asdf/installs/java/adoptopenjdk-8.0.265+1/
	export PATH=$PATH:$JAVA_HOME/bin/
fi
# . ~/.asdf/plugins/java/set-java-home.zsh
# if [[ -d "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/" ]]; then
# 	export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
# 	export PATH=$PATH:$JAVA_HOME/bin/
# fi
# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"

if [[ -d "~/.asdf/plugins/java/" ]]; then
	. ~/.asdf/plugins/java/set-java-home.zsh
fi

# Maven
if [[ -d "/opt/maven" ]]; then
    export M2_HOME=/opt/maven
    export M2=$M2_HOME/bin
    export PATH=$M2:$PATH
fi
if [[ -d "$HOME/.asdf/installs/maven/3.6.3" ]]; then
	export M2_HOME=$HOME/.asdf/installs/maven/3.6.3
	export M2=$H2_HOME/bin
    export PATH=$M2:$PATH
fi

# Tomcat
if [[ -d "/opt/tomcat" ]]; then
    export CATALINA_HOME=/opt/tomcat/
    export PATH=$CATALINE_HOME:$PATH
fi

#
# Hive
if [[ -d "$HOME/apache-hive-2.3.4-bin" ]]; then
    export HIVE_HOME=$HOME/apache-hive-2.3.4-bin
    export PATH=$PATH:$HIVE_HOME/bin
    export CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*:.
fi

# Hadoop
if [[ -d "$HOME/hadoop/hadoop-2.9.1" ]]; then
    export HADOOP_HOME=$HOME/hadoop/hadoop-2.9.1
    export HADDOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
    export HADOOP_SSH_OPTS="-p 222"

    export HADOOP_MAPRED_HOME=$HADOOP_HOME 
    export HADOOP_COMMON_HOME=$HADOOP_HOME 

    export HADOOP_HDFS_HOME=$HADOOP_HOME 
    export YARN_HOME=$HADOOP_HOME 
    export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
    export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

    export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin 
    export HADOOP_INSTALL=$HADOOP_HOME 

    export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*:.
fi

# Derby
if [[ -d "$HOME/db-derby-10.14.2.0-bin" ]]; then
    export DERBY_HOME=$HOME/db-derby-10.14.2.0-bin
    export PATH=$PATH:$DERBY_HOME/bin

    export CLASSPATH=$CLASSPATH:$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar
fi

export GPG_TTY=$(tty)

if [[ -d ~/.rbenv/ ]]; then
    # rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

if [[ -d ~/.nvm ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [[ -d /usr/local/go ]]; then
    export PATH="$PATH:/usr/local/go/bin"
    export GOROOT="/usr/local/go"
fi

if [[ -d $HOME/dotnet ]]; then
	export DOTNET_ROOT=$HOME/dotnet
	export PATH=$PATH:$DOTNET_ROOT
fi

if [[ -d $HOME/go ]]; then
	export GOPATH=$HOME/go
	export PATH="$PATH:$GOPATH/bin"
fi

if [[ -d $HOME/.cargo ]]; then
	export PATH="$PATH:$HOME/.cargo/bin"
fi

if [[ -d /usr/lib/dart/bin ]]; then
	export PATH="$PATH:/usr/lib/dart/bin"
fi

if [[ -d $HOME/.asdf/installs/rust/1.51.0/bin ]]; then
	export PATH="$PATH:$HOME/.asdf/installs/rust/1.51.0/bin"
fi

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

if [[ -d $HOME/Sync/beancount ]]; then
	export BEANCOUNT_ROOT=$HOME/Sync/beancount
fi


[[ -e "/home/einverne/lib/oracle-cli/lib/python3.6/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/einverne/lib/oracle-cli/lib/python3.6/site-packages/oci_cli/bin/oci_autocomplete.sh"
export PATH=/home/einverne/bin:$PATH


export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.fly/bin:$PATH"
