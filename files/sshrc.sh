if [ -f "$SSHHOME"/.sshrc.d/bash_colors ]; then
    . "$SSHHOME"/.sshrc.d/bash_colors
fi

if [ -f "$SSHHOME"/.sshrc.d/bashrc ]; then
    . "$SSHHOME"/.sshrc.d/bashrc
fi

if [ -f "$SSHHOME"/.sshrc.d/bash_aliases ]; then
    . "$SSHHOME"/.sshrc.d/bash_aliases
fi

if [ -f "$SSHHOME"/.sshrc.d/surc ]; then
    . "$SSHHOME"/.sshrc.d/surc
fi

if [ -d "$SSHHOME"/.sshrc.d/bashrc.d ]; then
    for file in "$SSHHOME"/.sshrc.d/bashrc.d/*; do
        . "$file"
    done
fi

INPUTRC=$SSHHOME/.sshrc.d/inputrc
