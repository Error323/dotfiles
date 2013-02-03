# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Colors
txtrst=`tput sgr0`
txtred=`tput setaf 1 && tput bold`
txtblu=`tput setaf 4`
txtpur=`tput setaf 5`
txtcyn=`tput setaf 6`
txtwht=`tput setaf 7`

# Set default editor
export VISUAL=vim

# Enable cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Standard C(++) compiler
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# Vi style keybindings
set -o vi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ git:\1/'
}

command_success() {
  if [ $? -eq 1 ]
  then
    PS1="${txtblu}[${txtred}\u@\h ${txtrst}${txtpur}\w${txtcyn}\$(parse_git_branch)${txtblu}]${txtrst}\n\$ "
  else
    PS1="${txtblu}[${txtwht}\u@\h ${txtrst}${txtpur}\w${txtcyn}\$(parse_git_branch)${txtblu}]${txtrst}\n\$ "
  fi
}

unset color_prompt force_color_prompt

# text-to-speech from google
say() { 
  local lang=${LANG%_*}
  local text="$*"

  if [[ "${1}" =~ -[a-z]{2} ]]
  then 
    lang=${1#-} 
    text="${*#$1}" 
  fi
  
  mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q='${text}'" &> /dev/null 
}


# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='vim'
alias apaste="curl -F 'paste=<-' http://apaste.info"
alias inet='lsof -P -i -n | cut -f 1 -d " "| uniq | tail -n +2'

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

case "$TERM" in
xterm*|rxvt*|linux|screen)
  PROMPT_COMMAND=command_success
  ;;
*)
  ;;
esac

export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'
