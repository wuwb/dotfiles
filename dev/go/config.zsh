zinit wait lucid for \
  OMZP::golang

if _is_callable go; then
  export GOPATH="$XDG_DATA_HOME/go"
  export GOROOT="$(brew --prefix go)/libexec"
#   # go env -w GOPROXY=direct

  # Adds $GOPATH/bin's to PATH
  path=( `printf '%s/bin\n' ${(@s/:/)GOPATH}` $path )
fi
