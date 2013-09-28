# Customize the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
#export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \W \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "
export PS1="👽 \[$(tput bold)\]\[$(tput setaf 6)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 1)\]\w$(parse_git_branch)\[$(tput setaf 3)\]∴\[$(tput sgr0)\] "

# Change input to use VI mode
set -o vi

# Programs
alias vim='/Applications/MacVim.app/Contents/MacOS/vim'

# List aliases
alias ls='ls -Gpa'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
set -o noclobber

# CD aliases
alias ..='cd ..'

# Grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' # Color the matches green

# Color git
git config --global color.ui true

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Define any user-specific variables here
source ~/.bashrc_custom

[[ -s /Users/jeff/.nvm/nvm.sh ]] && . /Users/jeff/.nvm/nvm.sh # This loads NVM
