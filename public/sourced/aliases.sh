# Generic
alias desk='cd ~/Desktop'
alias home='cd ~'
alias dotfiles='cd ~/dotfiles'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias s='ls -laG --color=auto'
alias T='tree'
alias t='tree -L 2'
alias gr='grep -i --color=auto'
alias cw='date +%V'
alias json-formatter='python -m json.tool'
alias xml-formatter='xmllint --format -'
alias cppwd='echo -n "$(pwd)" | pbcopy'
alias rm='rm -i'
alias diff='colordiff'
alias v='vim'
alias date_readable='date +"%Y-%m-%d_%H:%M.%S"'
alias r='fc -s'

# Redshift
alias day='redshift -O 6500'
alias night='redshift -O 3400'

# Touch screen
alias touchscreen='xinput enable 12'
alias notouchscreen='xinput enable 13'

# Clipboard
alias clipc='xclip -selection clipboard'
alias clipp='xclip -o'

# Git
alias grm='git rm'
alias gci='git commit'
alias gco='git checkout'
alias gst='git status --short --branch'
alias glo='git log'
alias gl1='git log -1'
alias gll='git log --oneline'
alias glg='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gla='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gbr='git branch'
alias grh='git reset --hard'
alias gpush='git push'
alias gpull='git pull --rebase'
alias gdiff='git diff'
alias gdw='git diff --word-diff'
alias gdl='git diff HEAD~1'
alias gadd='git add'
alias gstash='git stash'
alias greset='git reset'
alias grebase='git rebase'
alias gmerge='git merge'
alias gclone='git clone'
alias gremote='git remote'
alias gsc='git checkout $(git branch | fzf)'
alias gdel='git branch -d $(git branch | fzf)'
alias gsub='git submodule'
alias gsfp='git submodule foreach "git pull"'
alias gsadd='git submodule add'

# Android
alias curr_activity="adb shell dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
alias dex2jar='d2j-dex2jar.sh'
alias ai='adb install'
alias au='adb uninstall'
alias enable-ga-logging='adb shell setprop log.tag.GAv4 DEBUG'
alias adb-wifi='echo "Attach a device..."; adb tcpip 5555 && (adb shell ip route get 8.8.8.8 | cut -f8 -d\  | tr -cd [:print:]; echo :5555 ) | xargs adb connect'

# Codeforces
alias cf='git clone git@github.com:gilvegliach/CF.git'

# Fix cursor jumping around when typing
alias fix-cursor='syndaemon -t -k -i 1'
