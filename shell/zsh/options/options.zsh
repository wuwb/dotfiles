# ===== brew
# To opt in to Homebrew analytics, `unset` this in ~/.zshrc.local .
# Learn more about what you are opting in to at
# https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1

# ===== Common
export ZSH_COMPDUMP="${HOME}/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

export ENABLE_CORRECTION="true"
export ZSH_DISABLE_COMPFIX="true" # 禁用安全功能加快启动速度 0.06s
export HIST_STAMPS="yyyy-mm-dd"
export CASE_SENSITIVE="false"
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export HISTCONTROL='ignoreboth';
# Hide the “default interactive shell is now zsh” warning on macOS.
export BASH_SILENCE_DEPRECATION_WARNING=1;
# Don't offer history completion; we have fzf, C-r, and
# zsh-history-substring-search for that.
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
export ERL_AFLAGS="-kernel shell_history enabled"

# ===== History
# export HISTFILE="${HOME}/.cache/.zsh_history"
export HISTFILE="$XDG_CACHE_HOME/.zsh_history"

export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=100000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt APPEND_HISTORY # If this is set, zsh sessions will append their history list to the history file, rather than overwrite it
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Remove old events if new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY   
setopt HIST_BEEP                 # Beep when accessing non-existent history.

# ===== Changing Directories
setopt autocd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# ===== Completion
setopt COMPLETE_IN_WORD # Allow completion from within a word/phrase
setopt PATH_DIRS # Perform path search even on command names with slashes.
setopt AUTO_MENU # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt AUTO_LIST # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH # If a parameter is completed whose content is the name of a directory, then add a trailing slash.
# setopt AUTO_PARAM_KEYS
# setopt FLOW_CONTROL        # Disable start/stop characters in shell editor.
unsetopt MENU_COMPLETE # do not autoselect the first completion entry
unsetopt COMPLETE_ALIASES  # Completion for aliases
setopt ALWAYS_TO_END # When completing from the middle of a word, move the cursor to the end of the word
unsetopt CASE_GLOB

setopt auto_remove_slash # When the last character resulting from a completion is a slash and the next character typed is a word delimiter, remove the slash.

# ===== Correction
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments

# ===== Expansion and Globbing
setopt badpattern # If a pattern for filename generation is badly formed, print an error. If this option is unset, the pattern will be left unchanged.
setopt nomatch # If a pattern for filename generation has no matches, print an error

# ===== Prompt
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted


## ZSH configuration
# Treat these characters as part of a word.
WORDCHARS='_-*?[]~&.;!#$%^(){}<>'

unsetopt BRACE_CCL        # Allow brace character class list expansion.
setopt COMBINING_CHARS    # Combine zero-length punc chars (accents) with base char
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
setopt HASH_LIST_ALL
unsetopt CORRECT_ALL
unsetopt NOMATCH
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.
unsetopt BEEP             # Hush now, quiet now.
setopt IGNOREEOF

## Jobs
setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

## Directories
DIRSTACKSIZE=9
unsetopt AUTO_CD            # Implicit CD slows down plugins
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_MINUS
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt GLOB_DOTS
unsetopt AUTO_NAME_DIRS     # Don't add variable-stored paths to ~ list
