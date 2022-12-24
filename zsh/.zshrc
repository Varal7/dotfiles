HIST_STAMPS="yyyy-mm-dd"
ZSH_DISABLE_COMPFIX="true"


export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export ZSH=$HOME/.zsh

# Load extensions
#
# spaceship
source "$ZSH/spaceship/spaceship.zsh"
# z for jump
. $ZSH/z.sh
# zsh-nvm
source $ZSH/zsh-nvm/zsh-nvm.plugin.zsh
# zsh syntax-highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh completions
# fpath=($ZSH/zsh-completions/src $fpath)
#  rm -f ~/.zcompdump; compinit
# spaceship vi
source $ZSH/spaceship-vi-mode/spaceship-vi-mode.plugin.zsh


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR='nvim'

export PATH="/usr/local/go/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/neovim/bin:$PATH"
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

if ! type "$hub" > /dev/null; then
  eval "$(hub alias -s)"
fi

# Fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height=50% --min-height=15 --reverse"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Srouce zsh/config.d files
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
unset conf

# My aliases

alias vim="node -v > /dev/null && nvim"
alias sl="exa --icons"
alias l="exa --icons"
alias ll="exa --icons -la -snew"
alias lt="exa --icons --tree"
alias lz="exa --icons -la -ssize"
alias paf="readlink -f"
alias tl="tmux ls"
alias g="git"
alias chmox="chmod +x"
alias ipy="ipython"
alias py="ipython"
alias code='tmux new-session -s code "ipython" || t code'
alias fromcloud="curl https://vrac.varal7.fr/last.sh | sh"
alias lg="lazygit"
alias p="pnpm"

# node stuff
alias reyarn="trash yarn.lock node_modules/ && yarn"
alias pclean='pnpm clean && rmall && rm pnpm-lock.yaml && pnpm i && pnpm generate && pnpm build'
alias rmnode="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias rmdist="find . -name 'dist' -type d -prune -exec rm -rf '{}' +"
alias rmstore="find . -name '.DS_Store' -type f -delete"
alias rmts="find . -name 'tsconfig.tsbuildinfo' -type f -delete"
alias rmall="rmnode && rmdist && rmstore && rmts"

# conda stuff
alias ca="conda activate"
alias rca="conda deactivate && conda activate"
alias wp="which python"

# My functions
take() {
    mkdir -p $1
    cd $1
}

getl () {
  sed "$1q;d"
  # head -n $1 | tail -n 1
}
# capture the output of a command so it can be retrieved with ret
cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
ret () { cat /tmp/capture.out; }

export PYTHONBREAKPOINT=ipdb.set_trace

t() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

if [[ -a ~/.local-zshrc ]]; then
    source ~/.local-zshrc
fi

if [[ -r ~/.ghcup/env ]]; then
  source ~/.ghcup/env
fi

bindkey -e

# Spaceship
spaceship add --after line_sep vi_mode
alias vit=spaceship_vi_mode_enable
alias vitoff=spaceship_vi_mode_disable

