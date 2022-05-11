alias bgg='ssh karp@dev.geekdo.com'
alias resync='ssh karp@dev.geekdo.com /var/www/deployscripts/resync'
alias restart_nginx='ssh karp@dev.geekdo.com "sudo service nginx restart"'
alias pa='php artisan'
alias syncdata='rsync -e "ssh -i /Users/karp/.ssh" -avz karp@dev.geekdo.com:/var/www/karp/legacytests/data/ /Users/karp/Documents/git/bgg/legacytests/data/'
alias t="vendor/bin/phpunit"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR="nvim"
alias autosync='/Users/karp/scripts/autosync /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'
alias bsync='/Users/karp/scripts/rsyncnotify /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'
alias dave='ssh pair@wes.atst.io'
for f in /usr/local/etc/bash_completion.d/*; do source $f; done

PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '
PATH="/usr/local/bin:/Users/karp/.composer/vendor/bin:/usr/local/opt/ruby/bin:${PATH}:$HOME/bin"
export PATH
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:$HOME/.cabal/bin"
