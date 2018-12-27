VIRTUALENVWRAPPER=$HOME/.local/bin/virtualenvwrapper.sh
if [ -f $VIRTUALENVWRAPPER ]; then
    WORKON_HOME=$HOME/.virtualenvs
    PROJECT_HOME=$HOME/Documents/Projets
    VIRTUALENVWRAPPER_PYTHON=$(which python3)
    . $VIRTUALENVWRAPPER
fi
unset VIRTUALENVWRAPPER
