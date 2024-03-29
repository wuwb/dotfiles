#!/usr/bin/env zsh

CYCLE_TIME=${1:-3600}
CUR_DIR=${0:A:h}

# Kill running run.sh script, use /$$/ to exclude current run.sh script
declare -a run_script_pids
local ps_str=$(ps aux)
run_script_pids=($(echo ${ps_str} | grep -i "polybar/run.sh" | grep -v "grep" | tr -s ' ' | cut -d' ' -f2))
if [[ -n "${run_script_pids[@]/$$/}" ]]; then kill -9 ${run_script_pids[@]/$$/}; fi

# Calculate MONITOR and DPI
MONITOR=$(xrandr -q | grep primary | grep ' connected' | cut -d' ' -f1)
declare -xr MONITORS=($(xrandr -q | grep ' connected' | cut -d' ' -f1))
declare -x MONITOR=${MONITOR:-${MONITORS[1]}}
readonly MONITOR

# Reload bspwm monitor setting
if _is_running bspwm; then
  bspc monitor $MONITOR -d {1,2,3,4,5,6}
  for mon in ${MONITORS[@]/${MONITOR}/}; do
    bspc monitor $mon -d {1,2,3,4}
  done
fi

declare -x DPI
if [ "$GDK_SCALE" -eq 2 ]; then
  DPI=160
else
  DPI=92
fi
readonly DPI

pushd ~ >/dev/null

declare -a colors separators
colors=("${(@f)$(ls ${CUR_DIR}/resources/colors)}")
separators=("${(@f)$(ls ${CUR_DIR}/resources/separators)}")

while true; do
  pkill -u $UID -x polybar

  # Random select color and powerline separator
  selected_color=${colors[$(($RANDOM % ${#colors[@]} + 1))]}
  source ${CUR_DIR}/resources/colors/${selected_color}
  selected_separator=${separators[$(($RANDOM % ${#separators[@]} + 1))]}
  source ${CUR_DIR}/resources/separators/${selected_separator}
  
  # Set wallpaper based on selected_color
  declare -a color_wallpapers
  local selected_wallpaper

  # Set bspwm color
  _call bspc config focused_border_color ${shade3}
  _call bspc config presel_feedback_color ${shade3}

  # Reload polybar
  while pgrep -u $UID -x polybar >/dev/null; do sleep 0.3; done
  polybar main >$XDG_DATA_HOME/polybar.log 2>&1 &

  declare -x SIDE_MONITOR
  for SIDE_MONITOR in ${MONITORS[@]/${MONITOR}/}; do
    polybar side >>$XDG_DATA_HOME/polybar.log 2>&1 &
  done

  sleep ${CYCLE_TIME}
done

popd >/dev/null

echo "Polybar launched..."
