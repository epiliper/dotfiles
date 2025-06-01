alias 'v'='nvim'
alias 'bi'='cd $HOME/stuff/bioinformatics'

alias 'ls'='lsd -ha'
# alias 'enix'='sudoedit /etc/nixos/configuration.nix'
alias 'enix'='sh edit_and_change.sh /etc/nixos/configuration.nix sudoedit "sudo nixos-rebuild switch"'

export PS1='\e[1;34m\W \e[0m '
export EDITOR='nvim'
export PATH=$PATH:$HOME/stuff/scripts

eval "$(zoxide init bash)"
