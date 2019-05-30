#!/bin/bash
#Author: Bell<bell@greedlab.com>
#
# git delete branch
#

if [[ $# != 1 ]]; then
  echo
  echo "Usage: ${0##*/} [BRANCH]"
  echo
  echo "Example: ${0##*/} \"feature*\""
  echo
  exit 2
fi

target=$1

branches=$(git branch --format='%(refname:short)') || exit 1

find_branch=0
for branch in ${branches}
do
  if [[ -z $target ]] || [[ $branch == $target ]];then
    find_branch=1
    echo Are your sure to delete the branch \"${branch}\" ? [N/y]
    read sure
    if [[ $sure == y ]] || [[ $sure == Y ]];then
      git branch -D $branch
    fi
  fi
done

if [[ ${find_branch} -eq 0 ]];then
  echo "No branch \"$target\""
  exit 0
fi

exit 0
