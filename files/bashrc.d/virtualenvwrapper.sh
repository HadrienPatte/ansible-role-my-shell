if [ -f "$HOME"/.local/bin/virtualenvwrapper.sh ]; then
    WORKON_HOME="$HOME"/.virtualenvs
    PROJECT_HOME="$HOME"/Documents/Projets
    VIRTUALENVWRAPPER_PYTHON=$(which python3)
    . "$HOME"/.local/bin/virtualenvwrapper.sh
fi
