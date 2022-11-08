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
