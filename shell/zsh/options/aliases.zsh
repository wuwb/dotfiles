# https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer

# global
alias -g '...'='cd ../..'
alias -g '....'='cd ../../..'
alias -g '.....'='cd ../../../..'
alias -- -='cd -'

alias -g '_'='sudo'
alias -g BG='& exit'
alias -g C='| wc -l'
alias -g V=' --verbose'
alias -g tojson='| python -m json.tool'

alias -g :n='/dev/null'
alias -g :bg='&>/dev/null &'
alias -g :bg!='&>/dev/null &!'  # &!: background + disown

alias l='exa -lah --group-directories-first --git --time-style=long-iso'
alias lt='l -TI .git'
alias clc='clipcopy'
alias clp='clippaste'
alias clco='tee >(clipcopy)'  # clicpcopy + stdout
alias sc='sudo systemctl'
alias scu='systemctl --user'
alias sudo='sudo '
alias cgp='cgproxy '
alias pc='proxychains -q '
alias with-proxy=' \
    http_proxy=$MY_PROXY \
    HTTP_PROXY=$MY_PROXY \
    https_proxy=$MY_PROXY \
    HTTPS_PROXY=$MY_PROXY '

alias ~='cd $HOME'
alias /='cd /'

# in zsh common-aliases plugin
# alias -g G='|grep'
# alias -g H='|head'
# alias -g NUL="> /dev/null 2>&1"
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'

# unpack
alias -s zip='unzip'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s xz='tar -Jxf'
alias -s untar='tar -xvf'

# Unix
alias ll="ls -al"
alias ll2="ls -lgh"
alias la='ls -laFh'
alias ln="ln -v"

alias cp="cp -iv"
alias rm='rm -vi'
alias mv='mv -vi'
alias mkdir="mkdir -pv"
alias wget='wget -c' # Resume dl if possible
alias path='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
# alias path='echo $PATH | tr -s ":" "\n"' # 需要多依赖一个 tr 命令
alias ports='netstat -tulanp'
alias gurl='curl --compressed'

alias df="df -h"
alias free="free -m"
alias ag="ag -i"
alias dud="du -d 1"

alias sorry='sudo $(history -p !-1)'
alias kc='kubectl'
alias xmap="xargs -n1"
alias get_window_class="xprop | grep WM_CLASS"
alias pstop='watch "ps aux | sort -nrk 3,3 | head -n 5"'

alias rcpd='rcp --delete --delete-after'
alias rcpu='rcp --chmod=go='
alias rcpdu='rcpd --chmod=go='

alias sc=systemctl
alias ssc='sudo systemctl'

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git
alias gst="git status"
alias glg="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias gci='git commit -m'
alias gcl1="git clone --depth=1"
alias gdiff='git diff --name-only --diff-filter=U'
alias gdrop='git branch | grep -v "master" | xargs git branch -D '
alias gpm='git push --set-upstream origin master'

# git log
alias glog_branches="git log --color=always --oneline --decorate --graph --branches"
alias glog_branches_intag="echo You can append a tag name; LANG=C sleep 0.5; git log --color=always --oneline --decorate --graph --branches"
alias glog_simplify_decfull="git log --color=always --decorate=full --simplify-by-decoration"
alias glog_simplify="git log --color=always --simplify-by-decoration --decorate"
# ​git config --global url."https://gitclone.com/".insteadOf https://
# https://stackoverflow.com/a/15503178/1820217
alias gitlog="git ls-files -z | xargs -0n1 git blame -w --show-email | perl -n -e '/^.*?\((.*?)\s+[\d]{4}/; print $1,"\n"' | sort -f | uniq -c | sort -n"

# neovim
alias vim=nvim
# alias nvim=lvim
# alias vi=lvim
 
# tmux
alias tl=tmux list-sessions
alias tkss=tmux kill-session -t
alias ta=tmux attach -t
alias ts=tmux new-session -s
alias tmux="TERM=screen-256color tmux -2"
alias mux="TERM=screen-256color tmuxinator"

# nvm
alias mci="mvn -e -U clean install"
alias mcp="mvn -U clean package"
alias mvn-purge="mvn dependency:purge-local-repository"


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ip="ifconfig eth0 | grep inet | awk '{ print $2 }'"
alias ipv6="curl https://v6.ident.me/"
alias myip="curl https://ipinfo.io/json" # or /ip for plain-text ip
alias localip="ipconfig getifaddr en0"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"


# xxxxx
alias rmds="find . -name '*.DS_Store' -type f -delete && echo 'ALL .DS_STORE FILES RECURSIVELY REMOVED'"
alias rme="trash-put"
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
alias server="python -m http.server 8000"
# alias chrome="open -a 'Google Chrome' --args --disable-web-security --user-data-dir"
alias xz="cd ~/Downloads && aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c"
alias signode="codesign--sign - --force --deep - /usr/local/bin/node"
alias sudoinstall="sudo spctl --master-disable" # xattr -cr app
alias mntfs="mount_ntfs -o rw,nobrowse"
alias tq="curl wttr.in/Hangzhou"
alias up="softwareupdate -i -a"
# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias a1='mosh --ssh="ssh -p 8022" A1'
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias showhiddenfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehiddenfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdesktopicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktopicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Disable / enable Spotlight
alias disablespotlight="sudo mdutil -a -i off"
alias enablespotlight="sudo mdutil -a -i on"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# docker
alias docker-cli='eval "$(docker-machine env default)"'
alias dc="docker-compose"
alias dcrun="docker-compose run --rm"

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update; gem cleanup'

# ios
# alias respring="killall SpringBoard"
# alias respring2="killall -9 backboardd"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

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

# Programs
alias bat="bat --theme OneHalfLight"

# _is_callable exa alias ls="exa --color=auto --group-directories-first"
# _is_callable neofetch && alias nf="neofetch"
# _is_callable cmatrix && alias cm="cmatrix -C red"
# _is_callable tensorboard && alias tb="tensorboard"
# _is_callable bandwhich && alias bandwhich="sudo $(which bandwhich)"

if (( $+commands[exa] )); then
  alias exa="exa --group-directories-first --git";
  alias l="exa -blF";
  alias ll="exa -abghilmu";
  alias llm='ll --sort=modified'
  alias la="LC_COLLATE=C exa -ablF";
  alias tree='exa --tree'
fi

if (( $+commands[fasd] )); then
  # fuzzy completion with 'z' when called without args
  unalias z 2>/dev/null
  function z {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
  }
fi

alias rv='reveal-md --highlight-theme github --theme white --watch'
alias rvs='reveal-md --highlight-theme github --theme white --static revealjs_output'
alias yd='yt-dlp --write-auto-sub --ignore-errors'
alias yd2mp4='yt-dlp --write-auto-sub --ignore-errors --recode-video mp4'
alias yda='yt-dlp -i -o "%(title)s.%(ext)s" --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0'

#alias wakeonlan -i 192.168.68.24 9e:2a:71:df:e8:6f
