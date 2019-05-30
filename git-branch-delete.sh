#!/bin/bash
#Author: Bell<bell@greedlab.com>
#
# git delete branch
#

if [[ $# > 1 ]]; then
  echo
  echo "Usage: ${0##*/} [BRANCH]"
  echo
  echo "Example: ${0##*/} \"feature*\""
  echo
  exit 2
fi

target=$1

branches=$(git branch --format='%(refname:short)') || exit 1
for branch in ${branches}
do
  if [[ -z $target ]] || [[ $branch == $target ]];then
    echo Are your sure to delete the branch \"${branch}\" ? [y/N]
    read sure
    if [[ $sure == y ]] || [[ $sure == Y ]];then
      echo "The branch \"$branch\" has been deleted!"
    fi
  fi
done
exit 0
