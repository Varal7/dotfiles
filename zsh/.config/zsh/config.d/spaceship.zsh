# Spaceship
export SPACESHIP_PROMPT_ORDER=(
    time          # Time stampts section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elm           # Elm section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    gcloud        # Google Cloud Platform section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubectl       # Kubectl context section
    terraform     # Terraform workspace section
    git_last_commit
    proxy
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )


SPACESHIP_GIT_LAST_COMMIT_SHOW="${SPACESHIP_GIT_LAST_COMMIT_SHOW=true}"
SPACESHIP_GIT_LAST_COMMIT_SYMBOL="${SPACESHIP_GIT_LAST_COMMIT_SYMBOL=""}"
SPACESHIP_GIT_LAST_COMMIT_PREFIX="${SPACESHIP_GIT_LAST_COMMIT_PREFIX="("}"
SPACESHIP_GIT_LAST_COMMIT_SUFFIX="${SPACESHIP_GIT_LAST_COMMIT_SUFFIX=") "}"
SPACESHIP_GIT_LAST_COMMIT_COLOR="${SPACESHIP_GIT_LAST_COMMIT_COLOR="magenta"}"

spaceship_git_last_commit() {
  [[ $SPACESHIP_GIT_LAST_COMMIT_SHOW == false ]] && return

  spaceship::is_git || return

  local 'git_last_commit_status'

  git_last_commit_status=$(git log --pretty='format:%s 🕑 %cr' 'HEAD^..HEAD' 2>/dev/null | head -n 1)

  [[ -z $git_last_commit_status ]] && return

  spaceship::section \
    "$SPACESHIP_GIT_LAST_COMMIT_COLOR" \
    "$SPACESHIP_GIT_LAST_COMMIT_PREFIX" \
    "$SPACESHIP_GIT_LAST_COMMIT_SYMBOL$git_last_commit_status" \
    "$SPACESHIP_GIT_LAST_COMMIT_SUFFIX"

}

SPACESHIP_PROXY_SHOW="${SPACESHIP_PROXY_SHOW=true}"
SPACESHIP_PROXY_PREFIX="${SPACESHIP_PROXY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PROXY_SUFFIX="${SPACESHIP_PROXY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PROXY_SYMBOL="${SPACESHIP_PROXY_SYMBOL="✈️  "}"
SPACESHIP_PROXY_DEFAULT_VERSION="${SPACESHIP_PROXY_DEFAULT_VERSION=""}"
SPACESHIP_PROXY_COLOR="${SPACESHIP_PROXY_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of node, exception system.
spaceship_proxy() {
  [[ $SPACESHIP_PROXY_SHOW == false ]] && return

  [[ $http_proxy == "" ]] && return

  local 'proxy_str'
  proxy_str=$http_proxy

  spaceship::section \
    "$SPACESHIP_PROXY_COLOR" \
    "$SPACESHIP_PROXY_PREFIX" \
    "${SPACESHIP_PROXY_SYMBOL}${proxy_str}" \
    "$SPACESHIP_PROXY_SUFFIX"
}

