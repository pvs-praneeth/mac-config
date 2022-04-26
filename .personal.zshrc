#### History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# remove older duplicate entries from history
setopt HIST_IGNORE_ALL_DUPS

# remove superfluous/unnecessary blanks from history items
setopt HIST_REDUCE_BLANKS

# save history entries as soon as they are entered
setopt INC_APPEND_HISTORY

# share history between different instances of the shell
setopt SHARE_HISTORY

# Older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# Remove command lines from the history list when the first character on the line is a space.
# setopt HIST_IGNORE_SPACE

#### Plugin & System settings
# Understand the below color setting here
#   -- https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
## Enabling colorized output
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

## Set the default editor
export EDITOR=vim

## ASDF Config.
export ASDF_DIR=$HOME/.config/zsh/asdf
export ASDF_DATA_DIR=$ASDF_DIR/../.asdf-data
export ASDF_CONFIG_FILE=$HOME/.config/zsh/.asdfrc

## PowerLevel10K Config.
export POWERLEVEL9K_CONFIG_FILE=$HOME/.config/zsh/.p10k.zsh

## Setting the file for saving path marks
export PATHMARKS_FILE=$HOME/.config/zsh/.pathmarks

## FZF options
# # Toggle preview window visibility with '?'
# fzf --bind '?:toggle-preview'
# # Select all entries with 'CTRL-A'
# fzf --bind 'ctrl-a:select-all'
# # Copy the selected entries to the clipboard with 'CTRL-Y'
# --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
# # Open the selected entries in vim with 'CTRL-E'
# --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
# #Open the selected entries in vscode with 'CTRL-V'
# --bind 'ctrl-v:execute(code {+})'
# Use https://minsw.github.io/fzf-color-picker/ for color picker.
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=50%
--multi
--border
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
--color=fg:#f0efaa,bg:-1,hl:#eb2121
--color=fg+:#00b7ff,bg+:#262626,hl+:#eb2121
--color=info:#bbf07a,prompt:#d7005f,pointer:#af5fff
--color=marker:#87ff00,spinner:#af5fff,header:#f009f0
"

#### Themes & Plugins
source $HOME/.config/zsh/.fzf.zsh
source $HOME/.config/zsh/.p10k.zsh
source $HOME/.config/zsh/asdf/asdf.sh
source $HOME/.config/zsh/formarks/formarks.plugin.zsh
source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Key bindings
# Enable Ctrl-x-e or Ctrl-xe to edit command line
autoload -U edit-command-line
# Emacs style, opens vim editor
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

### Exporting path variables.
fpath=($ASDF_DIR/completions $fpath)

source $HOME/.config/zsh/.completions.zsh
source $HOME/.config/zsh/.alias.zsh