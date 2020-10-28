#!/bin/bash
# This is a modified version of the update_loop.sh from
# my mal-id-cache repo which first adds the ssh-key

CUR_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
source "${CUR_DIR}/directories"

cd "${MID_CACHE_REPO}"

# kill any previous runs, supervisor group still doesnt kill the
# python child process, just the ssh-agent and the shell
# this isnt perfect, the python process keeps running after
ps -ef | grep "mal_id_cache --loop --commit" | grep -v 'grep' | awk '{print $2}' | xargs -r kill

# run a new ssh-agent so that my bot account instead of my actual github
# account gets attached to the commits
exec ssh-agent sh -c 'ssh-add ~/.ssh/bot_sean; pipenv run mal_id_cache --loop --commit'
