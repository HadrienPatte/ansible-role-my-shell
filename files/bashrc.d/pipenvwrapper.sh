if [ -f "$HOME"/.local/bin/pipenvwrapper.sh ]; then
    WORKON_HOME="$HOME"/.virtualenvs
    PROJECT_HOME="$HOME"/Documents/Projets
    # PIPENVWRAPPER_USE_VIRTUALENVWRAPPER_FUNCTION_NAMES=1
    . "$HOME"/.local/bin/pipenvwrapper.sh
fi
