#!/bin/bash
#
# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the branch/status of the current git repository
#    * the branch of the current subversion repository
#    * the return value of the previous command
# 
# USAGE:
#
#   1. Save this file as ~/.git_bash_prompt
#   2. Add the following line to the end of your ~/.profile or ~/.bash_profile:
#        . ~/.git_bash_prompt
#

        RED="\[\e[0;31m\]"
     BG_RED="\[\e[41m\]"
     YELLOW="\[\e[0;33m\]"
      GREEN="\[\e[0;32m\]"
       BLUE="\[\e[0;34m\]"
  BOLD_BLUE="\[\e[1;34m\]"
  LIGHT_RED="\[\e[1;31m\]"
LIGHT_GREEN="\[\e[1;32m\]"
      WHITE="\[\e[37m\]"
 LIGHT_GRAY="\[\e[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function is_git_repository {
  git branch > /dev/null 2>&1
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working directory clean" ]]; then
    state="${GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}"
  else
    state="${RED}"
  fi
  
  remote_pattern="Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  else
    remote=""
  fi
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi
  
  branch_pattern="^On branch ([^${IFS}]*)"    
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
}

function set_prompt_symbol () {
  local BARE_SYMBOL="❦"
  if [[ $1 -eq 0 ]]; then
      PROMPT_SYMBOL="${BARE_SYMBOL}"
  else
      PROMPT_SYMBOL="${RED}${BARE_SYMBOL}${COLOR_NONE}"
  fi
}

function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the 
  # return value of the last command.
  set_prompt_symbol $?

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi
  
  PS1="${PROMPT_SYMBOL} \A ${BOLD_BLUE}\W${COLOR_NONE} ${BRANCH}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
