export ZSH=~/.oh-my-zsh
ZSH_THEME="spaceship"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting z zsh-completions)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR='nvim'


function nbstrip_all_cwd {
    for nbfile in *.ipynb; do
        echo "$( nbstrip_jq $nbfile )" > $nbfile
    done
    unset nbfile
}

take() {
    mkdir -p $1
    cd $1
}

export PATH=/usr/local/go/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

if ! type "$hub" > /dev/null; then
  eval "$(hub alias -s)"
fi


# Docker completion

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/data/rsg/nlp/quach/google-cloud-sdk/path.zsh.inc' ]; then . '/data/rsg/nlp/quach/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/data/rsg/nlp/quach/google-cloud-sdk/completion.zsh.inc' ]; then . '/data/rsg/nlp/quach/google-cloud-sdk/completion.zsh.inc'; fi

# Fzf stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#bindkey -s "^p" 'fo\n'

export FZF_DEFAULT_OPTS="--height=50% --min-height=15 --reverse"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)

tm() {
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

# ftpane - switch pane (@george-b)
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

lpp() {
  lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}


unalias ll
alias vim="nvim"

alias sl="ls"
alias ll="ls -larth"
alias lsh="ls -lSrh"
alias paf="readlink -f"
alias t="tm"
alias tl="tmux ls"
alias g="git"
alias chmox="chmod +x"
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ca='conda activate'
alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"
alias ccat='pygmentize -g'
alias ppp="paf . | pbcopy"

alias code='tmux new-session -s code "ipython" || t code'
alias py='vim +star ~/.temp.py'
alias temp='vim +star ~/.temp && cat ~/.temp | pbcopy'

alias todo='vim ~/.todo'
alias todo='vim -O ~/day.todo ~/h2'

# alias rm='echo "rm is disabled; use trash instead"'

alias yt3="youtube-dl --verbose --extract-audio --audio-format mp3"

if [[ -a ~/.local-zshrc ]]; then
    source ~/.local-zshrc
fi

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/varal7/Projects/dofus/DTMapViewer/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/varal7/Projects/dofus/DTMapViewer/node_modules/tabtab/.completions/electron-forge.zsh

export PATH="~/.cabal/bin:$PATH"

if [[ -r ~/.ghcup/env ]]; then
  source ~/.ghcup/env
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias reyarn="trash yarn.lock node_modules/ && yarn"

# export TOOLCHAINS=swift
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
getl () {
  sed "$1q;d"
  # head -n $1 | tail -n 1
}

alias reconda="conda deactivate && conda deactivate && conda deactivate && conda activate py365"

alias fromcloud="curl https://vrac.varal7.fr/last.sh | sh"
