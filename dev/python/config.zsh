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

# Cache in aliases because /usr/bin will be moved to top in .zshrc
zinit wait lucid for \
  OMZP::python \
  OMZP::pip
# OMZP::django

alias py=python
_is_callable python2 && alias py2=python2
_is_callable python3 && alias py3=python3

alias ipy=ipython
alias ipylab='ipython --pylab=qt5 --no-banner'
alias jp='jupyter notebook'
alias jpl='jupyter-lab --NotebookApp.iopub_data_rate_limit=10000000'

alias cda="source activate"
alias cdd="conda deactivate || source deactivate"
alias cdl="conda info --envs"

# Pipenv
alias pt="poetry"

_is_callable black && alias format-all-black='black -q **/*.py'
_is_callable autoflake && alias remove-py-imports="git diff --name-only origin/develop | xargs -I{} autoflake --in-place --remove-all-unused-imports {}"
