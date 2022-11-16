zinit wait lucid for \
  OMZP::git \
  OMZP::gitignore \
  wfxr/forgit
# OMZP::gh
# OMZP::git-extras
# TODO: https://github.com/zdharma/zinit/issues/477
# zinit ice svn wait lucid; zinit snippet OMZP::gitfast

alias gci="gh pr checks"
alias gcpr="gh pr create --assignee @me"
alias gist="gh gist create -p"
alias gistp="gh gist create" # secret
alias git-scan-secrets="git secrets --scan-history"

if [[ $(_os) == linux-* ]]; then
  export GCM_CREDENTIAL_STORE=gpg
fi

function git-copy-hooks() {
  if [[ -d ".git" ]]; then
    rm -rf ".git/hooks"
    cp -R $DOTTY_CONFIG_HOME/shell/git/template/hooks .git/
    echo-info "Overrided .git/hooks directory."
  else
    echo-fail "This is not a git dir."
  fi
}

function git-reset-submodules () {
  git submodule deinit -f .
  git clean -fdx -f
  git submodule update --init --recursive -j 8
}
