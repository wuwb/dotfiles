export PHPENV_ROOT="$XDG_DATA_HOME/phpenv"

_cache phpenv1 phpenv init - --no-rehash
env_rehash_cmds+=("phpenv rehash")

alias phe='phpenv'
alias phr='php-boris'
alias comp='composer'
