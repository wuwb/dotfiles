zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker

zinit wait lucid for \
  OMZP::docker-compose
# OMZP:docker-machine

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker/machine"

alias dk="docker"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias dkl='dk logs'
alias dkcl='dkc logs'
alias dkprune="docker system prune -a --filter='until=24h'"

dkclr() {
  dk stop $(docker ps -a -q)
  dk rm $(docker ps -a -q)
}

dke() {
  dk exec -it "$1" "${@:1}"
}

dk() {
  case $(_os) in
    linux-*) systemctl -q is-active docker || sudo systemctl start docker ;;
  esac
  docker $@
}
