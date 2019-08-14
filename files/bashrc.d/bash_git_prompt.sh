if [ -f "$HOME"/.bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    if [ -f "$HOME"/.git-prompt-colors.sh ]; then
        GIT_PROMPT_THEME=Custom
    fi
    . "$HOME"/.bash-git-prompt/gitprompt.sh
fi
