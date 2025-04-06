# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DEFAULT_CONDA_ENV="nscale"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pixegami-agnoster"
# ZSH_THEME="simple"
# ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# My plugins:
# git: aliases for git
# autonump: lets me use j pattern to jump to my most visited path with pattern in the name.
# aliases: als command will list all aliases
# zsh-syntax-highlighting: gives syntax highlighting for comments in terminal
# zsh-autosuggestions: gives autosuggestions based on my common history 
# you-should-use: tells me what shortcut is associated with my command, teaches me aliases
# Zsh-bat: 
plugins=(
  git
  autojump
  aliases
  zsh-syntax-highlighting
  zsh-autosuggestions
  you-should-use
  #zsh-bat
  tmux
  poetry
  kube-aliases
)

# ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Some personal aliases
#alias nvim='/etc/nvim/bin/nvim'
alias vim='nvim'
alias ca='conda activate'
ff() {
    find . -maxdepth 1 -name "$1" -print
}
alias dsa='docker stop $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'
alias version='lsb_release -a'
alias vim.='vim .'
alias gcane='git commit --amend --no-edit'
alias kge="kubectl get events --sort-by='.lastTimestamp'"
alias gcbr='git_checkout_remote_branch'
alias dda="docker rm -f \$(docker ps -a -q)"
alias kdn="kubectl describe node" # overwrites delete node
alias kbm="kubectl exec -it pytorch-dev-pod-dale-no-gpu -- /bin/zsh"
# Find all files in current dir that match argument 1, and apply command 2 to them 
alias faa="/home/oscar/Coding/Mine/MyConfig/zsh/scripts/find-and-apply.zsh"
alias exc="export KUBECONFIG=\${CHAOS_KUBECONFIG}"
alias exm="export KUBECONFIG=\${MI300_KUBECONFIG}"
alias kdi="kd inferenceservice"
alias sagu="sudo apt-get update && sudo apt-get upgrade"

git_checkout_remote_branch() {
  git fetch origin && git checkout -b "$1" origin/"$1"
}
# Personal settings:
# Keeps less from opening a seperate window
export LESS=FRX
#(note: some people prefer FRSX, where S enables truncating of long lines (i.e. sideways scroll)).

# History settings
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Key bindings
# Ctrl + p makes it so that one goes backwards in one's history, based on autocomplete
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^h' backward-word
bindkey '^l' forward-word

# Not case sensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# LINUX
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/oscar/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/oscar/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/oscar/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/oscar/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
eval "conda activate $DEFAULT_CONDA_ENV"
# <<< conda initialize <<<

# MACOS
# >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
#

# For mac:
# source /Users/oscarsavolainen/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2024-06-06 08:50:09
export PATH="$PATH:/Users/oscarsavolainen/.local/bin"

# Add go-path (e.g. for stern)
export PATH=$PATH:~/go/bin

# Load secrets file if it exists
if [ -f "$HOME/.secrets.sh" ]; then
  echo "Exporting secrets"
  source "$HOME/.secrets.sh"
fi

# Tmux startup configuration
# Only run this if not already in a tmux session and tmux is installed
if [[ -z "$TMUX" ]] && command -v tmux &> /dev/null; then
  # Check if tmux server is running (any session exists)
  tmux list-sessions &> /dev/null
  if [ $? -eq 0 ]; then
    # Tmux is running, just attach to main session
    exec tmux attach-session -t main
  else
    # No tmux running, create new session with all windows
    echo "Starting fresh tmux session..."
    exec ~/.tmux-startup.sh
  fi
fi

# For linux:
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

