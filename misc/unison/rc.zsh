function unison-sync() {
  # Usage:
  # unison-sync <local-workplace> <username>@<remote-hostname> <remote-workplace>
  # e.g. unison-sync /workplace ztlevi@kuro /workplace
  # You need to remove local or remote ~/.unison cache if failed
  if [[ $# -ne 3 ]]; then
    echo-fail "Need 3 argments but only have $#"
    echo-info "Usage: unison-sync <local-workplace> <username>@<remote-hostname> <remote-workplace>"
    return 0
  fi
  local remote_arg="ssh://$2/$3"

  if ! pgrep unison >/dev/null; then
    while :; do
      echo "Kill local and remote unison process... " $(date)
      ssh $2 "killall unison" && sleep 1 || true
      killall unison && sleep 1 || true
      echo "Starting unison process... " $(date)
      unison -ui text default.prf $1 $remote_arg
      echo "Unison process exited.  Sleeping before restarting.  ^C to exit. " $(date)
      sleep 30
    done
  fi
}

function unison-clean() {
   fd -H "\.unison\..*\.unison.tmp" | xargs rm -rf {}
}
