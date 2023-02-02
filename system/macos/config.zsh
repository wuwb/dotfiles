# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# export CC=/usr/bin/clang
# export CXX=/usr/bin/clang++
# export CXXFLAGS="-I/usr/local/include"
export C_INCLUDE_PATH="/usr/local/include"
export CPLUS_INCLUDE_PATH="/usr/local/include"
export LIBRARY_PATH="/usr/local/lib"
# export LDFLAGS="-L/usr/local/lib"

if _is_callable lesspipe; then
  export LESSOPEN='| /usr/bin/env lesspipe %s 2>&-'
fi


zinit wait lucid for OMZP::brew
# zinit ice svn wait lucid; zinit snippet OMZP::osx
zinit wait lucid for \
  atclone"touch music spotify _security" atpull"%atclone" 'OMZP::macos'

alias date=gdate

alias y=pbcopy
alias p=pbpaste

if _is_callable brew; then
  alias bru='brew update && brew upgrade && brew cleanup'
fi

alias stat="stat -x"
alias nt="nettop -cdP"

# OS X has no `md5sum`, so use `md5` as a fallback
_is_callable md5sum || alias md5sum="md5"
# OS X has no `sha1sum`, so use `shasum` as a fallback
_is_callable sha1sum || alias sha1sum="shasum"

_is_callable ggrep && alias grep="ggrep"

alias oo="open ."

alias cdicloud="cd '$HOME/Library/Mobile Documents/com~apple~CloudDocs'"
