# Path to your oh-my-zsh installation.
case "$OSTYPE" in
  darwin*)
    ZSH=~/.oh-my-zsh/
  ;;
  linux*)
    ZSH=/usr/share/oh-my-zsh/
  ;;
esac

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussel"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# brew path for macos
case "$OSTYPE" in
  darwin*)
    export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
  ;;
esac

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
	aws \
	docker \
	docker-compose \
	git \
	mvn \
	node \
	npm \
	kubectl \
	helm \
	yarn \
	archlinux \
	systemd \
  vi-mode \
  git-machete \
)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/corey/.gem/ruby/2.7.0/bin

# Set environment variables
if [ -f ~/config/zsh/bashenv ]; then
	source ~/config/zsh/bashenv
fi

# Set dircolors
case "$OSTYPE" in
  linux*)
    if [ -f ~/.config/zsh/dircolors.ansi-dark ]; then
      eval `dircolors ~/.config/zsh/dircolors.ansi-dark`
    fi
  ;;
esac

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
export PAGER='less'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

###-begin-services-completion-###
if type compdef &>/dev/null; then
  _services_completion () {
    local reply
    local si=$IFS

    IFS=$'\n' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" services completion -- "${words[@]}"))
    IFS=$si

    _describe 'values' reply
  }
  compdef _services_completion services
fi
###-end-services-completion-###

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/corey/cswoods/inventory/services/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/corey/cswoods/inventory/services/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/corey/cswoods/inventory/services/node_modules/tabtab/.completions/sls.zsh ]] && . /home/corey/cswoods/inventory/services/node_modules/tabtab/.completions/sls.zsh

# base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/corey/.npm/_npx/12722/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/corey/.npm/_npx/12722/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh. "/home/corey/.acme.sh/acme.sh.env"

# begin direnv
eval "$(direnv hook zsh)"
# end direnv

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

bindkey -v
bindkey '^[/' history-incremental-search-backward
zstyle ':completion:*' insert-tab false

# starhip zoom
eval "$(starship init zsh)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# begin nvm
case "$OSTYPE" in
  darwin*)
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  ;;
  linux*)
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/bash_completion
    source /usr/share/nvm/install-nvm-exec
  ;;
esac
# end nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.config/zsh/aliasrc ]; then
	source ~/.config/zsh/aliasrc
fi

# fzf
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
	source /usr/share/fzf/completion.zsh
fi
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
	source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
	source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# k3d
if [ -f ~/.config/zsh/k3d_completion ]; then
  source ~/.config/zsh/k3d_completion
fi

# ruby gems
if [ -d ~/.local/share/gem/ruby/3.0.0/bin ]; then
  export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $(which packer) packer

# krew
export PATH="${PATH}:${HOME}/.krew/bin"
 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# bun completions
[ -s "/Users/coreybrothers/.bun/_bun" ] && source "/Users/coreybrothers/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/coreybrothers/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

#lvim
export PATH=$PATH:/Users/coreybrothers/.local/bin
# lvim end
