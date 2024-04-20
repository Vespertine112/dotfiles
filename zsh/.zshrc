# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Load my fzf config
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626 --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf --color=border:#262626,label:#aeaeae,query:#d9d9d9 --border="rounded" --border-label="Find" --border-label-pos="0" --preview "bat --color=always --style="numbers" {}" --preview-window="border-rounded" --prompt=">" --marker=">" --pointer="=" --separator="─" --scrollbar=""'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd
	fzf
)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias py="python3"
alias rofi="/home/vespertine/.config/rofi/scripts/launcher_t6"
alias hiber="systemctl hibernate"
alias lg="lazygit"
alias fman="compgen -c | fzf | xargs man"
alias nukemodules="find . -name 'node_modules' -type d | xargs du -sh | sort -hr | fzf -m --header \"Select which to delete\" --preview 'cat $(dirname {})/package.json' | awk '{print $2}' | xargs -r rm -rf " 

bindkey "^[[3~" delete-char

# Bind paths for [Rofi & pipx]
export PATH=$HOME/.config/rofi/scripts:$PATH # Rofi
export PATH=$HOME/.local/bin:$PATH #pipx

# Boot starship
eval "$(starship init zsh)"

# Enable lprompt transience
zle-line-init() {
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT
  PROMPT="═   "
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi
  return ret
}

zle -N zle-line-init

# Fix default standard for c++ & set makeflags to compile on all cores
export CXXFLAGS="-std=c++20"
export MAKEFLAGS="-j$(nproc)"

export TERM="xterm-256color"
export FZF_CACHE=$HOME/.fzf-cache

export EDITOR=nvim
export VISUAL=nvim

export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/
