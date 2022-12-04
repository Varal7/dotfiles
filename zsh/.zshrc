export ZSH=~/.oh-my-zsh
ZSH_THEME="spaceship"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting z zsh-completions)
plugins+=(zsh-nvm)

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

source $ZSH/oh-my-zsh.sh

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

unalias ll
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

# My functions
take() {
    mkdir -p $1
    cd $1
}

getl () {
  sed "$1q;d"
  # head -n $1 | tail -n 1
}


# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# capture the output of a command so it can be retrieved with ret
cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
ret () { cat /tmp/capture.out; }

export PYTHONBREAKPOINT=ipdb.set_trace

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# t - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)

t() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# like normal z when used with arguments but displays an fzf prompt when used without.
unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}

if [[ -a ~/.local-zshrc ]]; then
    source ~/.local-zshrc
fi

if [[ -r ~/.ghcup/env ]]; then
  source ~/.ghcup/env
fi


