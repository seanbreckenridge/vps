# vps

Scripts used for installing/managing/restarting/monitoring processes on my server.

Uses [supervisord](http://supervisord.org/) to manage processes.

[My fork of superhooks](https://github.com/seanbreckenridge/superhooks) notifies me in discord whenever one of my processes dies, as does [netdata](https://www.netdata.cloud/) if there are any outliers in the hundreds of metrics it takes.

- Puts application code into `~/code`
- Centralizes logs in `~/logs`

This runs on an Debian server, but it should be OS agnostic. `vps_install` will throw a fatal error before starting if I'm missing any required commands. My server runs `nginx`, lots of the log based commands assume that.

[`jobs`](./jobs) includes jobs for [bgproc](https://github.com/seanbreckenridge/bgproc) (specifically, `bgproc_on_machine`) related to interacting with the server

[`bin`](./bin) includes scripts that are run on my machine or on the server

See [here](https://exobrain.sean.fish/post/server_setup/) for a blog post describing how I set up this server.

- [`vps_install`](./bin/vps_install) clones and sets up environments for each application. Checks that you have corresponding commands/packages installed and that required credential/files are in the right location, installs virtual environments/packages for each application.
- [`super`](./super) lets me interact with the underlying `supervisord`/`supervisorctl` processes with my environment variables/configuration.
- [`logs`](./logs) streams the logs from all applications
- [`vps_backup`](./bin/vps_backup) copies cache/token files to a tar.gz so they can be backed up. [runs with bgproc](https://github.com/seanbreckenridge/bgproc). [`backup_server`](./backup_server) is run from my computer, which ssh's into the server to run that. Runs once per day, in [`housekeeping`](https://sean.fish/d/housekeeping)
- [`vps_deploy`](./bin/vps_deploy) and [`deploy`](./deploy) are a basic ssh/git pull/restart/view logs script for projects which I deploy frequently
- [`generate_static_sites`](./bin/generate_static_sites) builds my static websites and places them in `~/static_files`.
- [`remsync`](./bin/remsync) is a script thats run on my machine, which rsyncs files from a local directory to the server. That directory is served with nginx, so I can sync something to the server from my CLI and send someone a link. [example output](https://gist.github.com/seanbreckenridge/2b11729859d248069a0eabf2e91e2800). Has two endpoints, `f` and `p`, which specify private (a non-autoindexed nginx listing) and public indexes.
- [`playlist`](./bin/playlist) interfaces with my [playlist manager](https://github.com/seanbreckenridge/plaintext-playlist). It allows me to select multiple playlists, combines all the files from those playlists into a single mp3 and syncs that up to my server with `remsync`. Often run this on my machine before I leave my house; I then listen to the file on my phone by going to corresponding URL.
- [`mediaproxy`](./bin/mediaproxy) to ssh into the server, `youtube-dl`/`ffmpeg` something and host it on a readable link. Has video/audio wrapper that use more of my [personal scripts](https://github.com/seanbreckenridge/dotfiles/) to prompt me to to select format codes, (similar to [`mpvf`](https://github.com/seanbreckenridge/mpvf/)). That way, I can press a keybind, which grabs the URL from my clipboard and re-hosts it on my server.
- [`shorten`](./bin/shorten) creates a shortened url using [`no-db-shorturl`](https://github.com/seanbreckenridge/no-db-shorturl)
- [`approve_comments`](./bin/approve_comments) approves comments for my guest book at [https://sean.fish](https://github.com/seanbreckenridge/glue)
- [`mnu`](./bin/mnu) runs the periodic job to update the [google sheet](https://github.com/seanbreckenridge/mnu_gsheets)

- [`directories`](./directories) is a helper script sourced at the top of other scripts that defines common application location environment variables

### Applications:

- https://github.com/seanbreckenridge/glue
- https://github.com/seanbreckenridge/mal-id-cache
- https://github.com/seanbreckenridge/mal-notify-bot
- https://github.com/seanbreckenridge/discord-countdown-bot
- https://github.com/seanbreckenridge/xqc-dvd
- https://github.com/seanbreckenridge/xkcd-favorites
- https://github.com/seanbreckenridge/animeshorts
- https://github.com/seanbreckenridge/subpath-serve
- https://github.com/seanbreckenridge/no-db-shorturl
- https://github.com/seanbreckenridge/mnu_gsheets
- https://github.com/Hiyori-API/checker_mal
- https://github.com/seanbreckenridge/projects
- https://github.com/seanbreckenridge/my_feed
- https://github.com/seanbreckenridge/back-arrow-script/
- https://github.com/seanbreckenridge/server_clipboard
- https://github.com/seanbreckenridge/dbsentinel
- https://github.com/seanbreckenridge/currently_listening
- https://github.com/seanbreckenridge/filmswap
