#!/usr/bin/env zsh

if _is_callable brew; then
    brew update && brew upgrade && brew cleanup
else
    echo-fail "homebrew not detected"
fi

brew cu
