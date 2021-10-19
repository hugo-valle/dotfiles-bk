# Tmux alias
alias tmux='tmux -2 -u'
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# conveience alias for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'

#Colorize GCC output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# save fingers!
alias l='ls'
# long listing of ls
alias ll='ls -l'
# colors and file types
alias lf='ls -CF'		
# sort by filename extension
alias lx='ls -lXB'              
# sort by size
alias lk='ls -lSr'              
# show hidden files
alias la='ls -A'               
# sort by date
alias lt='ls -ltr'              

# other aliases

# launch webpages from terminal
# alias bbc='firefox http://www.bbc.co.uk/ &'
# alias sd='firefox http://slashdot.org/ &'
# alias www='firefox'

# ssh to common destinations by just typing their name
# log in to 'Icarus Server'
alias icarus='ssh hugotest@icarus.cs.weber.edu'
# log in to work using a non-standard port (222)
# alias work='ssh work.example.com -p 222'
# log in to work and tunnel the internal proxy to localhost:80
# alias workweb='ssh work.example.com -p 222 -L 80:proxy.example.com:8080'

##################################################
##################################################
### History settings

# append, don't overwrite the history
#shopt -s histappend

# control the size of the history file
export HISTSIZE=100000
export HISTFILESIZE=409600

# ignore common commands
export HISTIGNORE=":pwd:id:uptime:resize:ls:clear:history:"
# ignore duplicate entries
export HISTCONTROL=ignoredups

# Ignore case
set completion-ignore-case on 

# No audible bell
set bell-style visible
##################################################
### Load local bin/ folder to PATH

PATH=$PATH:${HOME}/bin
##################################################
##################################################
### Variables

# define tool-specific settings
export LS_OPTIONS='--color=yes'
# Tidy up the appearance of less
export LESS='-X'

# define preferred tools
export EDITOR=vim
export PAGER=less

# man pages in color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

