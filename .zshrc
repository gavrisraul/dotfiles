# sudo apt install curl zsh
# chsh -s $(which zsh)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# https://github.com/riyadhalnur/quote-cli
COMMANDS=("fortune" "quote") # for arch path is "/usr/share/cows"
$(shuf -n1 -e "${COMMANDS[@]}") | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export PATH="${PATH}:${HOME}/.local/bin/"

ZSH_THEME="agnoster"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias szsh="source ~/.zshrc"

# GIT
GIT_AUTHOR_NAME="Raul Gavris" # change accordingly
GIT_AUTHOR_USERNAME="gavrisraul" # change accordingly
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="rg.raulgavris@gmail.com" # change accordingly
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global github.user "$GIT_AUTHOR_USERNAME"

branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
branch_name="(unnamed branch)" # detached HEAD
branch_name=${branch_name##refs/heads/}
gitCommitAllFunction() {
    git add "$1"
    git commit -m "$1"
    git push origin ${branch_name} -f
}
alias gitCommitAll=gitCommitAllFunction

alias 'gitdiff'='git difftool --tool=vimdiff'

alias rg='nvim'
alias please=sudo
# Key bindings
bindkey '^ ' autosuggest-accept # ctrl-space

source `which virtualenvwrapper.sh`
