# The intent of this file is to collect common public settings that usually
# go in .profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--no-color"

setjdk 1.8 2>/dev/null
