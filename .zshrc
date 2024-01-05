# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/paul/.config/paul_zsh"

# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="robbyrussell" 

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker git github zsh-autosuggestions history-substring-search zsh-syntax-highlighting)

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[path]=bold
#ZSH_HIGHLIGHT_STYLES[path_prefix]=bold
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='fg=1'

source $ZSH/paul_zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EIX_LIMIT=0
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt PUSHD_IGNORE_DUPS



bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# To get special keys working, you can also try to ask the terminfo database for the actual key sequences; this requires a valid terminfo database for the terminal in question, but works in most cases and requires no user interaction.
# The following snippet assigns data from the $terminfo[] array to a $key[] hash, that is compatible to the hash created by zkbd (see above). That makes it possible to switch back and forth between the zkbd solution and the terminfo solution in case something goes wrong.
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"     overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"       backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   forward-word
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" backward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
   function zle-line-init () {
           echoti smkx
        }
        function zle-line-finish () {
           echoti rmkx
        }
        zle -N zle-line-init
        zle -N zle-line-finish
fi

export EIX_LIMIT=0



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ran='ranger'
alias cat=bat

function  portageupd {
    sudo EMERGE_DEFAULT_OPTS="qv" sudo eix-sync -a
}

alias ses=portageupd
alias sew='sudo emerge -uND world'
alias se='sudo emerge'
if  [[ -v DESKTOP_SESSION ]]; then
alias ls=lsd
fi

alias cls=clear

eval "$(zoxide init zsh)"

