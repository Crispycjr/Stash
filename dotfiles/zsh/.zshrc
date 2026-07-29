# PROMPT
# -------

PROMPT='%B%F{blue}%~%f %F{gray}>%f%b '
# RPROMPT='%F{8} %n@%m%f'

# SSH CONDITION
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    RPROMPT='%F{yellow} %B%n@%m%b%f'
fi

# OPTIONS
# -------

# BASIC VI MODE
# bindkey -v
# export KEYTIMEOUT=1

setopt autocd extendedglob nonomatch histignorealldups incappendhistory sharehistory

# HISTORY
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTORY_IGNORE='(ls|ll|la|cd|cd ..|..|exit|clear|fetch|lf|v|vi|vim|nvim|cava|ncm|ncmp)'

# ALIASES
# -------

alias sudo='nocorrect sudo -E '     # 'sudo' alias fix
alias cp='cp -i'                    # Confirm before overwriting something
alias df='df -h'                    # Human-readable sizes
alias free='free -m'                # Show sizes in MB
alias tree='tree -C'                # Colorize tree
alias mkdir='mkdir -p'              # Make parent dirs as needed
alias history='history -di'
alias ls='ls -FHh --color=auto --group-directories-first'
alias la='ls -AFHh --color=auto --group-directories-first'
alias ll='ls -AFHhl --color=auto --group-directories-first'
alias diff='diff --color=auto'
alias grep='grep --color=auto' egrep='egrep --color=auto' fgrep='fgrep --color=auto'
alias sedit='sudoedit'
alias yz='yazi'
alias ncm='ncmpcpp' ncmp='ncmpcpp'
alias ytdlp='yt-dlp'
alias tracert='traceroute'
alias zypp-remove="zypper packages --unneeded | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' | grep -v Name | sudo xargs zypper -n remove --clean-deps"

# COMMAND ACCOMMODATION
(( $+commands[bat] )) && alias cat='bat'
(( $+commands[eza] )) && alias ls='eza'
(( $+commands[rg] )) && alias grep='rg'
(( $+commands[nvim] )) && alias vim='nvim' vi='nvim' v='nvim'

# FETCH SYSINFO
fetch() {
    local tool
    for tool in fastfetch pfetch hifetch neofetch screenfetch archey3 ufetch winfetch; do
        (( $+commands[$tool] )) && {
            command "$tool"
            return
        }
    done

    print "Error: No 'fetch' program is installed." >&2
    return 1
}

# COMPLETION
# ----------

zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

# ENABLE AUTO-COMPLETION OF PRIVILEGED ENVIRONMENTS IN PRIVILEGED COMMANDS
zstyle ':completion::complete:*' gain-privileges 1

# CASE-INSENSITIVE AUTOCOMPLETE
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=2
zmodload zsh/complist

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive tab completion
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'     # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                          # automatically find new executables in path

# SPEED UP COMPLETIONS
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache

# PLUGINS
# -------

# ZSH-AUTOSUGGESTIONS
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH-SYNTAX-HIGHLIGHTING
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# SET UP FZF KEY BINDINGS AND FUZZY COMPLETION
source <(fzf --zsh)

# VI-MODE
source $HOME/.config/zsh/vi-mode/vi-mode.zsh

bindkey '^F' autosuggest-accept

# TMUX
# If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# Otherwise start tmux
# [[ -z "$TMUX" ]] && exec tmux

# OPENCODE
export PATH=/home/ccjr/.opencode/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

