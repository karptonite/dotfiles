alias bgg='ssh karp@dev.geekdo.com'
alias resync='ssh karp@dev.geekdo.com sudo /var/www/deployscripts/resync'
alias resyncbeta='ssh karp@dev.geekdo.com sudo /var/www/deployscripts/resyncbeta'
alias pa='php artisan'
alias syncdata='rsync -e "ssh -i /Users/karp/.ssh" -avz karp@dev.geekdo.com:/var/www/karp/legacytests/data/ /Users/karp/Documents/git/bgg/legacytests/data/'
alias t="vendor/bin/phpunit"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR="vim"
alias autosync='/Users/karp/scripts/autosync /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'
alias bsync='/Users/karp/scripts/rsyncnotify /Users/karp/Documents/git/bgg/ karp@dev.geekdo.com:/var/www/karp/'

PATH="/usr/local/bin:/Users/karp/.composer/vendor/bin:/usr/local/opt/ruby/bin:${PATH}:$HOME/bin"
export PATH
