# >>> conda init >>>
_CONDA_PATH=$HOME/.local/miniconda2
function conda_init {
__conda_setup="$(CONDA_REPORT_ERRORS=false "${_CONDA_PATH}/bin/conda" shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "${_CONDA_PATH}/etc/profile.d/conda.sh" ]; then
        . "${_CONDA_PATH}/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="${_CONDA_PATH}bin:$PATH"
    fi
fi
unset __conda_setup
}
# <<< conda init <<<
