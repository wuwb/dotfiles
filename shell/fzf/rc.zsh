if _is_callable brew; then
    source $(brew --prefix fzf)/shell/key-bindings.zsh
    source $(brew --prefix fzf)/shell/completion.zsh 2>/dev/null
fi

bindkey '^[x' fzf-history-widget
bindkey '^[p' fzf-file-widget
bindkey '^r' fzf-history-widget
bindkey '\ej' fzf-cd-widget

for file in ${0:A:h}/addons/*.zsh; do
  source ${file}
done
