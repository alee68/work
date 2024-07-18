### For work Mac

# Homebrew path for Apple Silicon CPU
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3 installed by brew
export PATH=/usr/local/share/python:$PATH
alias python="python3"
alias tf="terraform"

# Configuration for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:/opt/homebrew/bin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH
#eval "$(pyenv init --path)"

# Configuration for virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# source /usr/local/bin/virtualenvwrapper.sh