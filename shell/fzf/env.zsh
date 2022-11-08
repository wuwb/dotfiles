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
