# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }

_is_callable() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null || return 1
  done
}
_uncallable() { 
  ! command -v "$1" >/dev/null; 
}
zman() { 
  PAGER="less -g -I -s '+/^       "$1"'" man zshall; 
}
k9() {
  # Usage: k9 22234 1213 or k9 chrome
  if echo $@ | rg -q "[\d\s\t]+"; then
    process_ids=("${(@f)}$@")
    kill -9 ${process_ids[@]} || "no process found by searching $@"
  else
    pkill -9 -f $@
  fi
}
sk9() {
  # Usage: k9 22234 1213 or k9 chrome
  if echo $@ | rg -q "[\d\s\t]+"; then
    process_ids=("${(@f)}$@")
    sudo kill -9 ${process_ids[@]} || "no process found by searching $@"
  else
    sudo pkill -9 -f $@
  fi
}
prg() {
  ps aux | rg -i $@
}
grep_search() { 
  echo $2 | grep -qiP $1; 
}
rg_search() { 
  echo $2 | rg -qS $1; 
}
vread() {
  (
    $@ > /tmp/dummy_vread_file
    nvim +Man! /tmp/dummy_vread_file
    rm -f /tmp/dummy_vread_file
  )
}

take() { mkdir "$1" && cd "$1"; }
hex() { echo -n $@ | xxd -psdu; }

function format-all-dos2unix() {
  if [[ -z $1 ]]; then
    echo "Missing file extension as first argument, e.g. java..."
  fi
  for filename in ./**/*.$1; do
    dos2unix $filename
  done
}

function format-all-shfmt() {
  fd -x shfmt -w -ci -i 2 -ln bash {} \; --regex '_init' .
  fd -x shfmt -w -ci -i 2 -ln bash {} \; -e zsh -e sh .
}

function string_join() {
  local IFS="$1"
  shift
  echo "$*"
}

function color-palette() {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
      printf "\n";
    fi
  done
}

function b64() {
  image=$(openssl base64 -in $1 | tr -d "\n")
  echo "![img](data:image/png;base64,$image)" | pbcopy
}

function unixtime-convert {
  # Usage: unixtime-convert 1638858888.708148250 UTC
  local TimeZone=${2:-"America/Los_Angeles"}
  TZ=$TimeZone date -d @"$1" +'%Y-%m-%d %H:%M:%S %Nns'
}

function envrehash() {
  for cmd in ${env_rehash_cmds[@]}; do
    eval "$cmd"
  done
}

center_text() {
  # Function "center_text": center the text with a surrounding border

  # first argument: text to center
  # second argument: glyph which forms the border
  # third argument: width of the padding

  local terminal_width=$(tput cols) # query the Terminfo database: number of columns
  local text="${1:?}"               # text to center
  local glyph="${2:-=}"             # glyph to compose the border
  local padding="${3:-2}"           # spacing around the text

  local text_width=${#text}

  local border_width=$(((terminal_width - (padding * 2) - text_width) / 2))

  local border= # shape of the border

  # create the border (left side or right side)
  for ((i = 0; i < border_width; i++)); do
    border+="${glyph}"
  done

  # a side of the border may be longer (e.g. the right border)
  if (((terminal_width - (padding * 2) - text_width) % 2 == 0)); then
    # the left and right borders have the same width
    local left_border=$border
    local right_border=$left_border
  else
    # the right border has one more character than the left border
    # the text is aligned leftmost
    local left_border=$border
    local right_border="${border}${glyph}"
  fi

  # space between the text and borders
  local spacing=

  for ((i = 0; i < $padding; i++)); do
    spacing+=" "
  done

  # displays the text in the center of the screen, surrounded by borders.
  printf "${left_border}${spacing}${text}${spacing}${right_border}\n"
}

function update_topics {
  declare -a topics
  topics=( "$DOTTY_DATA_HOME"/*.topic(N) )
  for topic in ${${${topics[@]#$DOTTY_DATA_HOME/}%.topic}/.//}; do
    ${DOTTY_HOME}/deploy -l ${topic}
  done
}

function sshf() {
  # Forward ssh port
  if [ "$#" -ne 2 ]; then
    echo "usage: sshf 10.0.0.1 6006"
    return 1
  fi
  local host="${1}"
  local port="${2}"
  kill -9 $(sudo lsof -ti:${port})
  ssh -NfL ${port}:localhost:${port} ${host}
}

# fuzzy find projects
function ff_projects() {
  # Each root is consist of PATH:scan_depth
  project_scans=("${HOME}:1" "${HOME}/Dropbox:1" "${HOME}/go/src:1" "${XDG_CONFIG_HOME}:1"
                 "${HOME}/dev:3" "${HOME}/dev-local:2" "${HOME}/git:2")

  projects=()
  local project scan_depth
  for project_scan in ${project_scans[@]}; do
    IFS=: read -r project scan_depth <<<"${project_scan}"
    project="$(readlink $project || echo $project)"
    if [[ -d ${project} ]]; then
      # Suppress errors, some dirs, e.g. .Trash, sometimes are not readable
      {
        for dir in $(find ${project} -maxdepth ${scan_depth} -type d); do
          if [[ -d ${dir}/.git ]]; then
            projects+=(${dir})
          fi
        done
      } 2>/dev/null
    fi
  done

  local IFS=$'\n'
  if _is_callable sk; then ff_cmd="sk"
  elif _is_callable fzf; then ff_cmd="fzf"
  else
    echo-fail "Please fzf or skim (sk) first"
    return 1
  fi
  selected_project=$(echo "${projects[*]}" | $ff_cmd)

  if [[ -n "$selected_project" ]]; then
    cd ${selected_project}
  fi
}
alias pp=ff_projects

# fkill - fuzzy find kill processes
fkill() {
  if _is_callable sk; then ff_cmd="sk"
  elif _is_callable fzf; then ff_cmd="fzf"
  else
    echo-fail "Please fzf or skim (sk) first"
    return 1
  fi
  pids=($(procs $(whoami) | sed '1,2d' | $ff_cmd -m | awk '{print $1}'))
  echo-info "kill -9 ${pids[@]}"
  kill -9 ${pids[@]} || "Failed to kill ${pids[@]}"
}

# fman - fuzzy find man page
function fman() {
  if _is_callable sk; then ff_cmd="sk"
  elif _is_callable fzf; then ff_cmd="fzf"
  else
    echo-fail "Please fzf or skim (sk) first"
    return 1
  fi
  man -k . | $ff_cmd -q "$1" --prompt='man> ' | awk -F'\(' '{print $1}' | xargs -r man
}

function update_git_repo() {
  local ERROR_SUMMARY_FILE=/tmp/update_dotty_error_summary
  dir=$1
  diff_str=$(
    cd $dir
    git diff
  )
  if [[ -d ${dir} && -z ${diff_str} ]]; then
    for repo in $@; do
      (cd ${repo} && git pull)
    done
  else
    echo "${dir} repo is dirty..." >>${ERROR_SUMMARY_FILE}
  fi
}

function update_dotty() {
  local ERROR_SUMMARY_FILE=/tmp/update_dotty_error_summary
  rm -f ${ERROR_SUMMARY_FILE} && touch ${ERROR_SUMMARY_FILE}

  echo-info "update $DOTTY_HOME"
  update_git_repo $DOTTY_HOME
  (
    cd $DOTTY_HOME
    git submodule update --remote --merge config
    echo-info "update ${DOTTY_ASSETS_HOME}"
    [[ -d ${DOTTY_ASSETS_HOME} ]] && cd ${DOTTY_ASSETS_HOME} && git pull
    update_topics &>/dev/null
  )


  if [[ -d ${XDG_CONFIG_HOME}/doom ]]; then
    local last_doom_rev=$(git -C ${XDG_CONFIG_HOME}/doom rev-parse HEAD)
    update_git_repo ${XDG_CONFIG_HOME}/doom &
    PID1=$!
    wait ${PID1}

    local cur_doom_rev=$(git -C ${XDG_CONFIG_HOME}/doom rev-parse HEAD)
    if [[ $cur_doom_rev != $last_doom_rev ]]; then
      echo-ok "Doom Sync Summary"
      doom sync
    fi
  fi

  echo-info "Update TPM packages"
  local tpm=$TMUX_PLUGIN_MANAGER_PATH/tpm
  if [[ -d $tpm ]]; then
    $tpm/bin/update_plugins all &
    PID2=$!
    wait ${PID2}
  fi

  _cache_clear
  envrehash

  echo-info "Error Summary"
  cat ${ERROR_SUMMARY_FILE}
  rm -f ${ERROR_SUMMARY_FILE}

  zinit delete --clean -y

  # Sync uninstalled some software if we deleted on one machine
  $DOTTY_HOME/legacy_sync_script.zsh
}

# used for mas
function find-app-id() {
  /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/"$1".app/Contents/Info.plist
}
