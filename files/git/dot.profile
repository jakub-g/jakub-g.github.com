############## README ##############
#
# 1. This file has to be renamed to '.profile'. I've renamed it to _.profile
#    so it's not hidden by 'ls' by default.
# 2. Perhaps you'll have to convert EOL to UNIX (\n), otherwise it may not work.
#
############## GENERAL ##############

# linux commands - this can be a separate file honestly
alias ll='ls -l'
alias cls='clear'

# alias to alias!
# depends on the shell; this one is for Windows (msysgit/MINGW32), Linux users should know their distro-specific file names
alias alias2='cat ~/.profile'       # display this file
alias aliasshow='cat ~/.profile'    
alias aliasedit='vim ~/.profile'
alias aliasload='source ~/.profile' # reload this file without quitting bash

############## GIT ##############

# ======================================================
# diff
# ======================================================
alias gd='git diff'
alias gds='git diff --stat'
alias gdc='git diff --cached'
alias gsh='git show'             # shows HEAD if parameterless
alias gshs='git show --stat'
alias gdl='git show HEAD'        # dl for '_d_iff of _l_atest commit'

# ======================================================
# status
# ======================================================
alias gs='git status'
alias gss='git status -s'

# ======================================================
# log
# ======================================================
alias gl='git log -5'
alias glog='git log -10'
alias gh='ghis'
alias ghis='ghism | cat' # it displays in less even if is short enough, thus cat
alias ghism='git log --format="%C(cyan)%cd%Creset %C(yellow)%h%Creset %s %Cgreen%an%Creset %n%C(black bold)%b%Creset" --date=short -10'
alias ghiss='git log --oneline -10'
alias glog1="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
alias glog2="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)- %an%C(reset)' --abbrev-commit"
alias glog3="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# ======================================================
# branches
# ======================================================
alias gb='git branch'
alias gbr='git branch'
alias gbra='git branch -a'
alias gck='git checkout'
alias goto='git checkout'
alias gmaster='git checkout master'

# ======================================================
# updating - from upstream
# ======================================================
alias gup='git pull --rebase upstream master'  # if merge conflicts are predicted, better pull without rebase
alias gupf='git stash && gup && git stash pop'
alias guptag='git fetch --tags upstream'       # tags are not downloaded by default

# ======================================================
# updating - from origin (syncing)
# ======================================================
alias gsync='git fetch origin && git rebase origin/master master'
alias gsyncf='git stash && gsync && git stash pop'
alias gsynctag='git fetch --tags origin'

# ======================================================
# adding & committing
# ======================================================
alias ga='git add -u .'             # git add all, but only already tracked (update)
alias gaaa='git add -A .'           # git add absolutely all
alias gunstage='git reset HEAD'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'       # Usage: gcam "Commit message". Don't confuse with commit --amend
alias gcm='git commit -m'           # Like above
alias gamend='git commit --amend'
alias gamendall='gaaa && gamend'

# ======================================================
# executing pre-commit hook
# ======================================================
#  this will invoke the pre-commit hook, but cancel the commit due to empty commit message
alias ghks="gcm ''"       # git-hook-staged: invoke the hook on staged files only
alias ghka="gcam ''"      # git-hook-all:    invoke the hook on all files modified in the working copy

# ======================================================
# pushing
# ======================================================
alias gpom='git push origin master'
alias gpomf='git push -f origin master'        # push --force, careful
alias gpushfork='git push origin master'
alias gpushatat='git push upstream master'
### no gpum='git push upstream master' here to avoid pushing to upstream by mistake due to a typo!

# deleting remote branch.
#  Usage:                          gdelremote foo
#  To delete local branch:         git branch -d foo
#  To force delete local branch:   git branch -D foo
alias gdelremote='git push origin --delete'

# ======================================================
# bisecting
# ======================================================
alias gbistart='git bisect start'
alias gbigood='git bisect good'
alias gbibad='git bisect bad'
alias gbiend='git bisect reset'

