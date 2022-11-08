if _is_callable brew; then
    source $(brew --prefix sk)/share/zsh/site-functions/key-bindings.zsh
    source $(brew --prefix sk)/share/zsh/site-functions/completion.zsh 2>/dev/null
fi

bindkey '^[x' skim-history-widget
bindkey '^[p' skim-file-widget
bindkey '^r' skim-history-widget
bindkey '\ej' skim-cd-widget
