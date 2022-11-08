export PYTHONUSERBASE=$HOME/.local
export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
export PYLINTHOME="$XDG_DATA_HOME/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
# For python3.7 and higher
# Set breakpoint() in Python to call pudb
export PYTHONBREAKPOINT="pudb.set_trace"

export PYTHONPATH=$PYTHONPATH:.

# Linux miniconda
[[ -d $HOME/miniconda/bin ]] && path=($path $HOME/miniconda/bin)
# MacOS miniconda
[[ -d /usr/local/Caskroom/miniconda/base/bin ]] && path=($path /usr/local/Caskroom/miniconda/base/bin)
