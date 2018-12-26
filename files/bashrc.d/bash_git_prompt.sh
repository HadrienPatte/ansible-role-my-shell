GITPROMPT=~/.bash-git-prompt/gitprompt.sh
if [ -f $GITPROMPT ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    if [ -f ~/.git-prompt-colors.sh ]; then
        GIT_PROMPT_THEME=Custom
    fi
    . $GITPROMPT
fi
unset GITPROMPT
