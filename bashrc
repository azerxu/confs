# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# set go env
export GOROOT_BOOTSTRAP=/usr/lib/go-bootstrap
export GOARCH=amd64
export GOOS=linux
export GOROOT=${HOME}/source/go
export GOPATH=${HOME}/source/gopath

# setting path
# PATH=${HOME}/source/nvim.packer.start/tabnine-nvim/binaries/4.4.312/x86_64-unknown-linux-musl:${PATH}
# PATH=${HOME}/source/ctDNA.pip/tools/:${PATH}
PATH=/opt/oracle-jdk-bin-11.0.2/bin:${PATH}
PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}
PATH=${HOME}/soft/vscode/code/bin:${PATH}
PATH=${HOME}/soft:${PATH}
PATH=${HOME}/perl5/bin${PATH:+:${PATH}}
PATH=${HOME}/.config/npm.global/bin:${PATH}
PATH=${HOME}/.yarn/bin:${PATH}
PATH=${HOME}/.local/share/gem/bin:${PATH}
PATH=${HOME}/.local/share/nvim/mason/bin/:${PATH}
PATH=${HOME}/.cargo/bin/:${PATH}
PATH=${HOME}/.local/bin:${PATH}
export PATH;

PERL5LIB="/home/azer/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/azer/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/azer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/azer/perl5"; export PERL_MM_OPT;

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# source ~/.profile
# alias dn="cd ~/doc/ctDNA/实验室合作伙伴/daan/"
alias epy2="source ~/dev/epy2/bin/activate"
alias epy3="source ~/dev/epy3/bin/activate"
alias torch="cd /home/azer/source/pytorch&&source ~/dev/pytorch/bin/activate"
alias gosrc="cd ~/source/gopath/src"
alias topme="top -u azer"
alias ls="ls -N --color=auto --group-directories-first"
alias ll="ls -la"
alias v2ray="cd /home/azer/soft/v2ray&&./v2ray run -d confs 1>>run.log 2>>run.log|tail -f run.log"
alias nfetch="/home/azer/soft/v2ray/nfetch.py"
alias nnfetch="proxychains /home/azer/soft/v2ray/nfetch.py fetch"
alias gpt="cd /home/azer/soft/edge-gpt&&edge-gpt --cookie-file *.cookie"
alias e="emacsclient -t --socket-name=/tmp/emacs1000/server"
alias v="nvim"
alias proxy="source /home/azer/soft/proxy/tproxy"
alias unproxy="source /home/azer/soft/proxy/untproxy"
alias ydl="youtube-dl --proxy socks5://127.0.0.1:9090"
alias nonvidia="source /home/azer/soft/non-nvidia.cmd"
alias kkitty="source /home/azer/soft/non-nvidia.cmd&&kitty"

alias wow="/home/azer/data/wolk/wow.cmd"
alias h3="/home/azer/data/hero3/SOD//h3.cmd"


## setting git bash prompt

# Regular
txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White

# Bold
bldblk="$(tput setaf 0 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;30m')"  # Black
bldred="$(tput setaf 1 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;31m')"  # Red
bldgrn="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;32m')"  # Green
bldylw="$(tput setaf 3 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;33m')"  # Yellow
bldblu="$(tput setaf 4 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;34m')"  # Blue
bldpur="$(tput setaf 5 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;35m')"  # Purple
bldcyn="$(tput setaf 6 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;36m')"  # Cyan
bldwht="$(tput setaf 7 2>/dev/null)$(tput bold 2>/dev/null || echo '\e[1;37m')"  # White

# Underline
undblk="$(tput setaf 0 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;30m')"  # Black
undred="$(tput setaf 1 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;31m')"  # Red
undgrn="$(tput setaf 2 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;32m')"  # Green
undylw="$(tput setaf 3 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;33m')"  # Yellow
undblu="$(tput setaf 4 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;34m')"  # Blue
undpur="$(tput setaf 5 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;35m')"  # Purple
undcyn="$(tput setaf 6 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;36m')"  # Cyan
undwht="$(tput setaf 7 2>/dev/null)$(tput smul 2>/dev/null || echo '\e[4;37m')"  # White

# Background
bakblk="$(tput setab 0 2>/dev/null || echo '\e[40m')"  # Black
bakred="$(tput setab 1 2>/dev/null || echo '\e[41m')"  # Red
bakgrn="$(tput setab 2 2>/dev/null || echo '\e[42m')"  # Green
bakylw="$(tput setab 3 2>/dev/null || echo '\e[43m')"  # Yellow
bakblu="$(tput setab 4 2>/dev/null || echo '\e[44m')"  # Blue
bakpur="$(tput setab 5 2>/dev/null || echo '\e[45m')"  # Purple
bakcyn="$(tput setab 6 2>/dev/null || echo '\e[46m')"  # Cyan
bakwht="$(tput setab 7 2>/dev/null || echo '\e[47m')"  # White

# Reset
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset


find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=' '
  fi
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"

# Default Git enabled prompt with dirty state
export PS1="\[$bldgrn\][\u@\h \W]\[$txtred\]\$git_dirty\[$txtblu\]\$git_branch\$ \[$txtrst\]"

# Default Git enabled root prompt (for use with "sudo -s")
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

export SCIPY_PIL_IMAGE_VIEWER=display
export OPENAI_API_KEY=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
export XCOMPOSEFILE=/usr/share/X11/locale/zh_CN.UTF-8/Compose
