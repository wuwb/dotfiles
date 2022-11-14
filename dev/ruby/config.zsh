export GEMRC="$XDG_CONFIG_HOME/gems/rc:$GEMRC"
export GEM_HOME="$XDG_DATA_HOME/gems"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem/specs"
export IRBRC="$XDG_CONFIG_HOME/irb/rc"
export PRYRC="$XDG_CONFIG_HOME/pry/rc"
export SPEC_OPTS="--color --order random"

export RBENV_ROOT="$XDG_DATA_HOME/rbenv"

_cache rbenv1 rbenv init - --no-rehash
env_rehash_cmds+=("rbenv rehash")

zinit wait lucid for \
  OMZP::ruby \
  OMZP::rbenv \
  OMZP::gem

alias rb="ruby"
alias rbe="rbenv"
alias rdb="pry -r"

alias rk="${aliases[rk]:-rake}"
alias rkg="${aliases[rkg]:-rake -g}"

alias bu="bundle"
alias bue="bundle exec"
alias bui="bundle install -path vendor"
