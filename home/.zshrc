source "$HOME/.homesick/repos/homeshick/homeshick.sh"

source <(antibody init)
antibody bundle < ~/.zsh_plugins

# bind UP and DOWN arrow keys
for keycode in '[' '0'; do
bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# Aliases and functions
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan,bold'

# Commands and builtins
ZSH_HIGHLIGHT_STYLES[command]="fg=green"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=green,bold"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=green,underline"
ZSH_HIGHLIGHT_STYLES[commandseparator]="none"

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'

# Globbing
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold'

# Options and arguments
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'

ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=green"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=green"

# Patterns
ZSH_HIGHLIGHT_PATTERNS+=('mv *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo ' 'fg=white,bold')

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history     # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history   # Include more information about when the command was executed, etc
setopt hist_ignore_dups   # Ignore duplication command history list
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit'
setopt hist_find_no_dups  # When searching history don't display results already cycled through twice'
setopt share_history      # Share command history data

eval `dircolors ~/.dircolors`
