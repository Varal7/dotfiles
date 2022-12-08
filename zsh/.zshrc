HIST_STAMPS="yyyy-mm-dd"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

source "$HOME/.zsh/spaceship/spaceship.zsh"
. $HOME/.zsh/z.sh

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

alias vim="nvim"
alias sl="exa --icons"
alias l="exa --icons"
alias ll="exa --icons -la -snew"
alias lt="exa --icons --tree"
alias paf="readlink -f"
alias tl="tmux ls"
alias g="git"
alias chmox="chmod +x"
alias ipy="ipython"
alias code='tmux new-session -s code "ipython" || t code'
alias reyarn="trash yarn.lock node_modules/ && yarn"
alias fromcloud="curl https://vrac.varal7.fr/last.sh | sh"
alias lg="lazygit"
alias pclean='pnpm clean && rmall && rm pnpm-lock.yaml && pnpm i && pnpm generate && pnpm build'
alias rmnode="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias rmdist="find . -name 'dist' -type d -prune -exec rm -rf '{}' +"
alias rmstore="find . -name '.DS_Store' -type f -delete"
alias rmts="find . -name 'tsconfig.tsbuildinfo' -type f -delete"
alias rmall="rmnode && rmdist && rmstore && rmts"
alias t="tmux a -t"


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

if [[ -a ~/.local-zshrc ]]; then
    source ~/.local-zshrc
fi

if [[ -r ~/.ghcup/env ]]; then
  source ~/.ghcup/env
fi

bindkey -e
