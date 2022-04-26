# +--------+
# | System |
# +--------+

alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'

# alias bigf= 'find / -xdev -type f -size +500M'  # display "big" files > 500M

# +-----+
# | Zsh |
# +-----+

alias dh='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index # directory stack

# +----------+
# | Folders |
# +----------+

# alias dot="$HOME/.dotfiles"

# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias lc='ls -CF'
alias ll='ls -lah'
alias lf='ls -lahF'
alias lt='ls -lahtF'
alias lr='ls -lahrF'
alias lg='ls -lhd .?* |sort -d -k 1.1,1.1r -k 9 && ls -lh | grep "^-" | sort -d -k 1.1,1.1r -k 9 && ls -lh | grep "^d" | sort -d -k 1.1,1.1r -k 9 && ls -lh | grep "^l" | sort -d -k 1.1,1.1r -k 9'

# +----+
# | cp |
# +----+

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

# +------+
# | grep |
# +------+

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# +------+
# | time |
# +------+

alias time='/usr/bin/time'

# +---------+
# | netstat |
# +---------+

alias port="netstat -tulpn | grep"

# +-----+
# | Git |
# +-----+

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --pretty=oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)

alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

# +--------+
# | docker |
# +--------+
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockRr='docker rm $(docker ps -a -q)'                                     # delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias dockce='docker-compose run --rm'

# +----------------+
# | docker-compose |
# +----------------+

alias docker-compose-dev='docker-compose -f docker-compose-dev.yml' # run a different config file than the default one

# Mindmaps
# alias freebrain="freemind $CLOUD/knowledge_base/_BRAINSTORMING/*.mm &> /dev/null &"
# alias freelists="freemind $CLOUD/knowledge_base/_LISTS/*.mm &> /dev/null &"
# alias freepain="freemind $CLOUD/knowledge_base/_PROBLEMS/*.mm &> /dev/null &"
# alias freeproj="freemind $CLOUD/knowledge_base/_PROJECTS/*.mm &> /dev/null &"

# +--------+
# | Random |
# +--------+
alias chrome="open -a 'Google Chrome'"
alias java-all-versions="/usr/libexec/java_home -V"