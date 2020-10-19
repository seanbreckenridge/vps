#!/bin/bash
# This is a modified version of the update_loop.sh from
# my mal-id-cache repo which first adds the ssh-key

CUR_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "${CUR_DIR}/directories"

cd "${MID_CACHE_REPO}"

# run a new ssh-agent so that my bot account instead of my actual github
# account gets attached to the commits
exec ssh-agent sh -c 'ssh-add ~/.ssh/bot_sean; pipenv run mal_id_cache --loop --commit'
# ssh-add "${HOME}/.ssh/bot_sean"
# exec pipenv run mal_id_cache --loop --commit
