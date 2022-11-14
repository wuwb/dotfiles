export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

[[ -f "$CARGO_HOME/env" ]] && source "$CARGO_HOME/env"

alias rs=rustc
alias rsp=rustup
alias ca=cargo
alias rustbook="rustup docs --book"
