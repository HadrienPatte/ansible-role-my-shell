# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load colors variables
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=1000000000

# Use an unlimited history file
# HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; history -n; "

# History appearance
HISTORY_COLOR_LWHITE="\033[1;37m"
HISTORY_COLOR_NORMAL="\033[00m"
HISTTIMEFORMAT=`echo -e $HISTORY_COLOR_LWHITE[%F %T] $HISTORY_COLOR_NORMAL `
HISTIGNORE='cd:ls:ll:la:l:pwd:e:ssu:h:a:s:gl:..'
unset HISTORY_COLOR_LWHITE HISTORY_COLOR_NORMAL

# Set the default editor
if [ -x "$(which vim)" ]; then
    VISUAL=vim
    EDITOR=$VISUAL
fi

# Add local bin to Path
PATH="$HOME/.local/bin:$PATH"

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    if [[ "$USER" == "root" ]]; then
        PS1="${debian_chroot:+($debian_chroot)}${CYAN}\A ${LRED}\u@\h ${YELLOW}\w\`if [[ \$? != \"0\" ]]; then echo \"${RED}\"; fi\` #${NORMAL} "
    else
        if [ -z $SSHHOME ]; then
            PS1="${debian_chroot:+($debian_chroot)}${CYAN}\A ${LBLUE}\u ${YELLOW}\w${LWHITE}\`if [[ \$? != \"0\" ]]; then echo \"${RED}\"; fi\` \$${NORMAL} "
        else
            PS1="${debian_chroot:+($debian_chroot)}${CYAN}\A ${LGREEN}\u@\h ${YELLOW}\w\`if [[ \$? != \"0\" ]]; then echo \"${RED}\"; fi\` \$${NORMAL} "
        fi
    fi
else
    PS1="${debian_chroot:+($debian_chroot)}<\t>[\u@\h:\w]\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias lscolor='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases
alias ls='lscolor --time-style=long-iso -v'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# If the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ] || [ -x /usr/share/command-not-found ]; then
    function command_not_found_handle {
        # Check because c-n-f could've been removed in the meantime
        if [ -x /usr/lib/command-not-found ]; then
            /usr/bin/python /usr/lib/command-not-found -- $1
            return $?
        elif [ -x /usr/share/command-not-found ]; then
            /usr/bin/python /usr/share/command-not-found -- $1
            return $?
        else
        return 127
        fi
    }
fi

if [ -d ~/.bashrc.d ]; then
    for file in ~/.bashrc.d/*; do
        . "$file"
    done
fi
