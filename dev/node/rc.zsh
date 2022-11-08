zinit wait lucid for \
  OMZP::npm \
  OMZP::nvm
# OMZP::react-native

# Run locally installed bin-script, e.g. n coffee file.coffee
alias n='PATH="$(npm bin):$PATH"'

alias npmgL0="npm list -g --depth=0"

_is_callable prettier && alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}" --ignore-path $DOTTY_CONFIG_HOME/shell/git/ignore'
_is_callable prettier && alias format-all-md='prettier --write "**/*.md" --ignore-path $DOTTY_CONFIG_HOME/shell/git/ignore'
