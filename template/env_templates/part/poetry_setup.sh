# Values
PYTHON_COMMAND=python3
RC_FILE=~/.bashrc
EXPORT_PATH='export PATH="~/.local/bin:$PATH"'
WORKSPACE=/workspace

# Install poetry and setup
cd /workspace
## Install poetry
curl -sSL https://install.python-poetry.org | ${PYTHON_COMMAND} -
## Add poetry to PATH
echo ${EXPORT_PATH} >> ${RC_FILE}
${EXPORT_PATH}
## poetry settings
poetry config virtualenvs.in-project true

# Install packages
cd ${WORKSPACE}
poetry install
echo "source ${WORKSPACE}/.venv/bin/activate" >> ${RC_FILE}