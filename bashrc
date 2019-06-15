alias goagent="python2.7 ~/source/goagent/local/proxy.py"
alias gogo="sh ~/soft/GoGo-1.9.0/start.sh"
alias gosrc="cd ~/source/gopath/src"
alias gongs="cd ~/source/gopath/src/gongs"
alias gobin="cd ~/source/gopath/bin"
alias epy2="source ~/epy2/bin/activate"
alias vbox="sudo modprobe vboxdrv vboxnetflt vboxnetadp"
alias estart="sudo /etc/init.d/emacs.azer restart"
alias git-tree="while true; do clear; git lg|cat; sleep 1; done"
alias apcreate="sudo create_ap --no-virt wlp3s0 enp0s25 azer"
alias vpn="sudo tincd -n smartquerier"
alias samtools="~/soft/samtools-1.2/samtools"
alias gw="sudo route add -net 192.168.135.0/24 gw 192.168.131.1"
alias pgw="sudo route add -net 192.168.130.0/24 gw 192.168.131.1"
alias dn="cd ~/doc/ctDNA/实验室合作伙伴/daan/"
alias pp="java -jar ~/source/printer/print-server.jar"
alias gfw="sudo /etc/init.d/shadowsocks.client start"
alias ss="/home/azer/source/shadowsocks-qt5/build/src/ss-qt5"

# export GOROOT=/usr/lib/go
export GOROOT_BOOTSTRAP=/usr/lib/go
export GOARCH=amd64
export GOOS=linux
export GOROOT=${HOME}/source/go
export GOPATH=${HOME}/source/gopath

# setting ibus
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus

# setting path
PATH=${GOROOT}/bin:${GOPATH}/bin:${PATH}
PATH=~/source/xmr-stak/build/bin:${PATH}
PATH=~/source/ctDNA.pip/tools/:${PATH}
PATH=~/.cargo/bin:${PATH}
PATH=${HOME}/soft/vscode/usr/share/code/bin:${PATH}
export PATH

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

#
export R_LIBS=${HOME}/.rlibs

#PATH="/home/azer/perl5/bin${PATH+:}${PATH}";
#export PATH

PERL5LIB="/home/azer/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}";
PERL5LIB="/home/azer/soft/vep":${PERL5LIB}
# PERL5LIB="/home/azer/tmp/CEGMA_v2.5/lib":${PERL5LIB}
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/azer/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/azer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/azer/perl5"; export PERL_MM_OPT;


# setting arvados
HISTIGNORE=$HISTIGNORE:'export ARVADOS_API_TOKEN=*'
export ARVADOS_API_TOKEN=6b0mgx5b0kh54vl19nnpn74wrskhws4zmuglo58192deyeft7d
export ARVADOS_API_HOST=avtst.smartquerier.com:10001
unset ARVADOS_API_HOST_INSECURE

