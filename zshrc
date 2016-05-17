# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(gitfast sprunge osx sprunge tmux virtualenv-prompt)

source $ZSH/oh-my-zsh.sh

# User configuration

# If this is a tmux shell, load tmux-specific functions
if [ -n "$TMUX" ]; then
    source ~/.tmux/functions
fi

# Adjust prompt to include virtualenv
export PROMPT='λ %~/ $(git_prompt_info)$(virtualenv_prompt_info)$Y_SANDBOX_PROMPT_SUFFIX%{$reset_color%}'
export ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
export ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX

export PATH="$HOME/bin:$HOME/.local/bin:/Library/TeX/texbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
#
# include local man files
export MANPATH=$HOME/include/man:$HOME/include/share/man:$MANPATH

# display tmux header if not tmuxxed
if [ -z "$TMUX" ]; then
    source `which tmux-sessions-header`
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Make ctrl-p behave like up arrow
bindkey "^P" up-line-or-search

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias tmux='tmux -2' # force tmux to use 256-colors
alias dl="ls -t ~/Downloads | head -n 1 | sed -e 's:^:'"$HOME"'/Downloads/:'" # latest download
alias t='tmux a'
alias xclip='xclip -selection clipboard' # because the only time i'm using xclip is to access the linux desktop clipboard
alias btmm='dns-sd -B _ssh._tcp | grep -oe "[0-9]\+\.members\.btmm\.icloud\.com"' # scan for multicast ssh connections, which reveals back to my mac domains

export EDITOR=vim

# url encode and decode
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
