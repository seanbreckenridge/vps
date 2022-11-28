#!/bin/bash
# shell functins to source into my laptop environment

alias vultr='ssh vultr'
alias vultr_logs='vultr "~/vps/logs"'
alias shorten='${REPOS}/vps/shorten'
alias remsync='${REPOS}/vps/remsync'
alias remsync-public='REMSYNC_PUBLIC=1 ${REPOS}/vps/remsync' # to push to /p/ (public index)
# to use ranger to quickly remove/add files
alias remsync-ranger='ranger "${HOME}/Documents/remsync" && remsync'
alias remsync-public-ranger='ranger "${HOME}/Documents/remsync_public" && remsync-public'
alias playlist='${REPOS}/vps/playlist'
alias approve-comments='${REPOS}/vps/approve_comments'
alias print-new-comments='${REPOS}/vps/approve_comments --print-new-comments'
export CUBING_JSON="${REPOS}/glue/cubing.json"
alias restart-glue='ssh vultr "cd ./code/glue && git pull && ~/vps/super --ctl restart glue-server"'
alias dotfiles-pull='ssh vultr "cd ./.dotfiles && git pull"'
alias page-hits="curl -s 'https://sean.fish/api/page_hit' | jq '.count'"
alias gb-comments="curl 'https://sean.fish/api/gb_comment' | jq 'reverse'"
# print/select open shortened urls
# https://github.com/seanbreckenridge/no-db-static-shorturl
alias shorturls="ssh vultr 'ls shorturls'"
alias shz="shorturls | fzf | sed -e 's|^|https://sean.fish/s/|' | tee /dev/tty | clipcopy"
remsync-html-from-stdin() {
	local tmpf
	# https://sean.fish/d/tmpfile?redirect
	tmpf="$(tmpfile html)"
	echo 'Reading from stdin...' >&2
	cat >"$tmpf"
	remsync "$tmpf"
}
