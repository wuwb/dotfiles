export TERMINFO="$XDG_CONFIG_HOME/terminfo"

if [ -d /home/linuxbrew/.linuxbrew/ ]; then
  path=(/home/linuxbrew/.linuxbrew/bin $path)
fi

# CUDA
if [ -d /usr/local/cuda/ ]; then
  path=(/usr/local/cuda/bin $path)
fi
