  # ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _ 
#  / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |
# | |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |
# | |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|
 #

# +---------+
# | General |
# +---------+

#### Loading more completions scripts that are not available in Zsh yet
# fpath=($DOTFILES/zsh/plugins/zsh-completions/src $fpath)
fpath=($HOME/.config/zsh/zsh-completions/src $fpath)

#### Loading "complist" module.
# complist module provides a menu list from where we can highlight and select completion results.
# Should be called before compinit
zmodload -i zsh/complist

##### Auto completion settings.

## Initialize the completion for the current session.
# Autoloading the function 'compinit' and call it.
autoload -Uz compinit
compinit

# +---------+
# | Options |
# +---------+

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# +---------+
# | zstyles |
# +---------+

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

## Defining the Completers
# Defining the completer we’ll use for our completion system. Here are some interesting ones.
# _complete - This is the main completer we need to use for our completion.
# _approximate - This one is similar to _complete, except that it will try to correct what you’ve typed already (the context) if no match is found.
# _expand_alias - Expand an alias you’ve typed. It needs to be declared before _complete.
# _extensions - Complete the glob *. with the possible file extensions.

# The order matters here. The completion system will try each of these completer one after the other.
# The completion stop when some matches are found or when the completer stop it by itself.
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate

## Caching the Completion
# style cache-path allows to set the filename and location of the cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompcache"

## Formatting The Display
# Each completer can define different sequences (beginning with %) for different tags.
# Summary of sequences you can use:

# %F{<color>} %f - Change the foreground color with <color>.
# %K{<color>} %k - Change the background color with <color>.
# %B %b - Bold.
# %U %u - Underline.

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

## Grouping Results
# Grouping different type of matches under their descriptions.
zstyle ':completion:*' group-name ''
# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

## Detailed List of Files and Folders
zstyle ':completion:*' file-list all

# Colorful Completion List
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Squeezing slashes, "//" is expanded to "/"
zstyle ':completion:*' squeeze-slashes true

# style "matcher-list" allows us to filter the matches of the completion with patterns.
# Will complete the results with partial words that we have typed.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'