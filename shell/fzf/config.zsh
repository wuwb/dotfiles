if _is_callable fd; then
  export FZF_ALT_C_COMMAND="fd --hidden -t d ."
fi
export FZF_DEFAULT_COMMAND="fd --hidden --type f || git ls-tree -r --name-only HEAD || rg --files --hidden || find ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--reverse --ansi"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:4,bg:7,hl:3
 --color=fg+:7,bg+:4,hl+:3
 --color=info:5,prompt:5,pointer:7
 --color=marker:5,spinner:5,header:5'

export FZF_COMPLETION_TRIGGER=','
export FZF_CTRL_R_OPTS="--no-sort"

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
