if _is_callable fd; then
  export SKIM_ALT_C_COMMAND="fd --hidden --type d ."
fi

export SKIM_DEFAULT_COMMAND="fd --hidden --type f || git ls-tree -r --name-only HEAD || rg --files --hidden || find ."
export SKIM_CTRL_T_COMMAND=$SKIM_DEFAULT_COMMAND
local skim_theme_options="--color=light,current:15,current_bg:12,current_match_bg:3,current_match:0,info:4,cursor:7"
export SKIM_DEFAULT_OPTIONS="--reverse --ansi ${skim_theme_options}"
