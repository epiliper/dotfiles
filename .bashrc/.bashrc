alias ls='lsd -a'
alias grep='grep --color=auto'
alias hx='helix'
# alias v="nvim"
# export EDITOR="nvim"
alias v='vim'
export EDITOR='vim'
. "$HOME/.cargo/env"

alias mm='make'
alias mc='make clean'

export PS1='\[\033[1;34m\]\W\[\033[0m\] '
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/stuff/scripts/:$PATH
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

export LIBCLANG_PATH=/usr/lib/llvm21/lib
export PATH=/usr/lib/llvm21/bin:$PATH

eval "$(zoxide init bash)"
set -o vi

colormode() {
	local stub=~/.config/alacritty
	if [ -f "${stub}/.theme_light" ]; then
		rm -r "${stub}/.theme_light"
		ln -sf "${stub}/dark.toml" "${stub}/theme.toml"
		touch "${stub}/.theme_dark"
	else
		rm -r "${stub}/.theme_dark"
		ln -sf "${stub}/light.toml" "${stub}/theme.toml"
		touch "${stub}/.theme_light"
	fi

	touch "${stub}/alacritty.toml"
}

export -f colormode

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/eli/.lmstudio/bin"
# End of LM Studio CLI section

export PATH=/home/eli/edirect:${PATH}
