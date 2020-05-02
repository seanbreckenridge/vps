#!/bin/bash
# This is a modified version of the update_loop.sh from
# my mal-id-cache repo which first adds the ssh-key

CUR_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "${CUR_DIR}/directories"

# add the ssh key so mal-id-cache can sync to github
ssh-add -l || ssh-add "${HOME}/.ssh/github"

cd "${MID_CACHE_REPO}"
exec pipenv run mal_id_cache --loop --commit

