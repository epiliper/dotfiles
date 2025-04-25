export PATH=/opt/homebrew/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/eli/stuff/bioinformatics/h5n1/sratoolkit.3.1.1-mac-arm64/bin:$HOME/stuff/python:.

export BASH_SILENCE_DEPRECATION_WARNING=1
export JUPYTER_PATH=/opt/homebrew/lib/python@3.10/bin/python3.10:$JUPYTER_PATH
export PATH=~/.cargo/bin:~/.local/bin:$PATH:/Users/eli/.local/bin/bbmap/:/Users/eli/.local/SPAdes-4.0.0-Darwin/bin:/nix/var/nix/profiles/default/bin/
export PYTHONPATH="/opt/homebrew/bin/python3.11"
export PYTHONPATH="${PYTHONPATH}:~/stuff/bioinformatics/vapid4"
export EDITOR="/opt/homebrew/bin/nvim"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/homebrew/Caskroom/miniforge/base/lib"
export LD_RUNPATH_SEARCH_PATH="$LD_RUNPATH_SEARCH_PATH:/opt/homebrew/Caskroom/miniforge/base/lib"

### clang
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# export CC=/opt/homebrew/Cellar/llvm/19.1.3/bin/clang
####

export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-linux-gnu-gcc

alias 'od'='cd /Users/eli/Library/CloudStorage/OneDrive-UW/RSV\ serology/neut\ analysis\ EP'
alias 'v'='nvim'
alias 'wj'='jupyter notebook /Users/eli/stuff/work/python' 
alias 'ystop'='yabai --stop-service'
alias 'ygo'='yabai --start-service'
# alias 'ls'='ls -a --color'
alias 'vap4'='python3.11 ~/stuff/bioinformatics/vapid4/vapid4.py'

alias 'smooth'='python3.11 ~/smoothing.py s'
alias 'rough'='python3.11 ~/smoothing.py r'

alias 'bi'='cd $HOME/stuff/bioinformatics'

alias 'tsh'='sh test_run_cmd.txt'
alias 'neofetch'='macchina'
alias 'ls'='lsd -ha'
alias 'pyeh'='source /Users/eli/stuff/bioinformatics/hsv-postgres/env/bin/activate'
alias 'pye'='source /Users/eli/stuff/python/env/bin/activate'
alias 'tenv'='source /Users/eli/tensor_env/bin/activate'

export books_dir="$HOME/stuff/books"
alias bopen='cd $books_dir; bn="$(find $books_dir/. -type f | fzf)"; zathura "${bn}" & disown -h'

export PS1='\e[1;34m\W \e[0m '

export DOCKER_DEFAULT_PLATFORM=linux/amd64


. "$HOME/.cargo/env"

eval "$(zoxide init bash)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
PATH="/Users/eli/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/eli/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/eli/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/eli/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/eli/perl5"; export PERL_MM_OPT;

##
# Your previous /Users/eli/.bash_profile file was backed up as /Users/eli/.bash_profile.macports-saved_2024-10-11_at_09:42:00
##

# MacPorts Installer addition on 2024-10-11_at_09:42:00: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

