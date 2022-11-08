# install antigen with brew install antigen
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

# robbyrussell's oh-my-zsh
ansible
# autoenv
battery
git
git-extras
#heroku
#gradle
tig
pip
lein
autojump
docker
docker-compose
brew
node
npm
cp
sudo
mosh
# emoji
extract
command-not-found
colored-man-pages
# redis-cli
osx

# zsh-users
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting

# others
unixorn/autoupdate-antigen.zshplugin
zdharma/fast-syntax-highlighting
seletskiy/zsh-git-smart-commands
MichaelAquilina/zsh-you-should-use
akoenig/npm-run.plugin.zsh
djui/alias-tips

EOBUNDLES

# Load the theme
antigen theme half-life

# Apply antigen plugins
antigen apply

# fix autosuggest paste slow problem, This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
