# Path to your oh-my-zsh installation.
export ZSH=/Users/karp/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="robbyrussell"

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
plugins=(npm docker composer yarn)

# User configuration

export COMPOSER_HOME=$HOME/.composer

export PATH="/usr/local/bin:/usr/local/sbin:/Users/karp/.composer/vendor/bin:/usr/local/opt/ruby/bin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/mysql/bin:/Users/karp/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$COMPOSER_HOME/vendor/bin"
source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS='--bind ctrl-f:page-down,ctrl-b:page-up'
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias bgg='ssh karp@dev.geekdo.com'
alias resync='ssh karp@dev.geekdo.com /var/www/deployscripts/resync'
alias restart_nginx='ssh karp@dev.geekdo.com "sudo service nginx restart"'
alias pa='php artisan'
alias syncdata='rsync -e "ssh -i /Users/karp/.ssh" -avz karp@dev.geekdo.com:/var/www/karp/legacytests/data/ /Users/karp/Documents/git/bgg/legacytests/data/'
alias t="vendor/bin/phpunit"
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
# export EDITOR="nvim"
alias autosync='/Users/karp/scripts/autosync /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'
alias bsync='/Users/karp/scripts/rsyncnotify /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'
alias dave='ssh pair@wes.atst.io'

PROMPT='${ret_status} %{$fg[cyan]%}%2~%{$reset_color%} $(git_prompt_info)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/llvm/bin:$PATH"
#export PATH="/usr/local/opt/php@7.3/bin:$PATH"
#export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
