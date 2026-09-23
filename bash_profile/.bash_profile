nxerr () {
	workdir=$(grep "exited; workDir" .nextflow.log | tail -n 1 | sed -E 's/.*workDir\: ([0-9A-Za-z\/:-]+).*/\1/g')
	echo $workdir
	if [[ -z $workdir ]]; then 
		echo "not found"
	else
		aws s3 cp --recursive "$workdir" ~/stuff/nextflow_errs/
			vim -o "$HOME/stuff/nextflow_errs/.command.err" \
				"$HOME/stuff/nextflow_errs/.command.log" \
				"$HOME/stuff/nextflow_errs/.command.out"
	fi
}

export -f nxerr

export PATH=~/.local/bin:$PATH
export PATH=/opt/homebrew/bin:/usr/local/bin/Users/eli/stuff/bioinformatics/h5n1/sratoolkit.3.1.1-mac-arm64/bin:$HOME/stuff/python:$HOME/.config/emacs/bin:$PATH
export PATH="$(brew --prefix llvm)/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1
export JUPYTER_PATH=/opt/homebrew/lib/python@3.10/bin/python3.10:$JUPYTER_PATH
# export PATH=~/.cargo/bin:~/.local/bin:$PATH:/Users/eli/.local/bin/bbmap/:/Users/eli/.local/SPAdes-4.0.0-Darwin/bin:/nix/var/nix/profiles/default/bin/
export PYTHONPATH="/opt/homebrew/bin/python3.11"
export PYTHONPATH="${PYTHONPATH}:~/stuff/bioinformatics/vapid4"
export EDITOR="$(which vim)"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/homebrew/Caskroom/miniforge/base/lib"
# export LD_RUNPATH_SEARCH_PATH="$LD_RUNPATH_SEARCH_PATH:/opt/homebrew/Caskroom/miniforge/base/lib"
# export DYLD_LIBRARY_PATH=/opt/homebrew/include/vulkan:$DYLD_LIBRARY_PATH
export CPATH=$CPATH:/opt/homebrew/include
export PKG_CONFIG_PATH=/opt/homebrew/opt/:$PKG_CONFIG_PATH
#
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin:$PATH
export PATH=${JAVA_HOME}/bin:$PATH

## brew llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"

### clang
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# export CC=/opt/homebrew/Cellar/llvm/19.1.3/bin/clang
####
export AWS_PROFILE=saml
export AWS_DEFAULT_PROFILE=saml

# vulkan via homebrew install
export VK_LAYER_PATH=/opt/homebrew/opt/vulkan-validationlayers/share/vulkan/explicit_layer.d

export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-linux-gnu-gcc

alias 'od'='cd /Users/eli/Library/CloudStorage/OneDrive-UW/RSV\ serology/neut\ analysis\ EP'
alias 'vis'='vise'
alias 'v'='vim'
alias 'mpile'='samtools mpileup -x -B -A -d 0 -Q 0 --ff UNMAP'
alias 'wj'='jupyter notebook /Users/eli/stuff/work/python' 
alias 'ystop'='yabai --stop-service'
alias 'ygo'='yabai --start-service'
# alias 'ls'='ls -a --color'
alias 'vap4'='python3.11 ~/stuff/bioinformatics/vapid4/vapid4.py'
alias 'credaws'="source $HOME/clones/refresh_aws.sh"

alias 'smooth'='python3.11 ~/smoothing.py s'
alias 'rough'='python3.11 ~/smoothing.py r'

alias 'bi'='cd $HOME/stuff/bioinformatics'

alias 'tsh'='sh test_run_cmd.txt'
alias 'neofetch'='macchina'
alias 'ls'='lsd -hat'
alias 'pyeh'='source /Users/eli/stuff/bioinformatics/hsv-postgres/env/bin/activate'
alias 'pye'='source /Users/eli/stuff/python/env/bin/activate'
alias 'tenv'='source /Users/eli/tensor_env/bin/activate'
alias 'sc'='samtools view -@ 10 -c'

export books_dir="$HOME/stuff/books"
export PATH="$HOME/.local/bin/ncbi":$PATH
alias bopen='cd $books_dir; bn="$(find $books_dir/. -type f | fzf)"; zathura "${bn}" & disown -h'

export PS1='\[\033[1;34m\]\W\[\033[0m\] '

export DOCKER_DEFAULT_PLATFORM=linux/amd64


. "$HOME/.cargo/env"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(zoxide init bash)"
set -o vi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eli/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eli/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/eli/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eli/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"


##
# Your previous /Users/eli/.bash_profile file was backed up as /Users/eli/.bash_profile.macports-saved_2026-02-11_at_15:05:16
##

# MacPorts Installer addition on 2026-02-11_at_15:05:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/eli/.lmstudio/bin"
# End of LM Studio CLI section

export VULKAN_SDK=$HOME/VulkanSDK/1.4.357.1/macOS
export PATH=$VULKAN_SDK/bin:$PATH
export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
