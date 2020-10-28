# vps

Scripts used for installing/managing/restarting/monitoring processes on my server (and my server).

Uses [supervisord](http://supervisord.org/) to manage processes.

[My fork of superhooks](https://github.com/seanbreckenridge/superhooks) notifies me in discord whenever one of my processes dies, as does [netdata](https://www.netdata.cloud/) if there are any outliers in the hundreds of metrics it takes.

* Puts application code into `~/code`
* Centralizes logs in `~/logs`

This runs on an Debian server, but it should be OS agnostic. `vps_install` will throw a fatal error before starting if I'm missing any required commands. My server runs `nginx`, lots of the log based commands assume that.

See [here](https://exobrain.sean.fish/post/server_setup/) for a blog post describing how I set up this server.

* [`vps_install`](./vps_install) clones and sets up environments for each application. Checks that you have corresponding commands/packages installed and that required credential/files are in the right location, installs virtual environments/packages for each application.
* [`super`](./super) lets me interact with the underlying `supervisord`/`supervisorctl` processes with my environment variables/configuration.
* [`logs`](./logs) streams the logs from all applications
* [`glogs`](./glogs) lets me interact with the nginx logs
* [`update_logs`](./update_logs) uses [`goaccess`](https://goaccess.io/) to visualize nginx logs
* [`backup`](./backup) copies cache/token files to a tar.gz so they can be backed up. [runs with bgproc](https://github.com/seanbreckenridge/bgproc)
* [`generate_static_sites`](./generate_static_sites) builds my static websites and places them in `~/static_files`.
* [`remsync`](./remsync) is a script thats run on my machine, which rsyncs files from a local directory to the server. That directory is served with nginx, so I can sync something to the server from my CLI and send someone a link. [example output](https://gist.github.com/seanbreckenridge/2b11729859d248069a0eabf2e91e2800). Has two endpoints, `f` and `p`, which specify private (a non-autoindexed nginx listing) and public indexes.
* [`playlist`](./playlist) interfaces with my [playlist manager](https://github.com/seanbreckenridge/plaintext-playlist). It allows me to select multiple playlists, combines all the files from those playlists into a single mp3 and syncs that up to my server with `remsync`. Often run this on my machine before I leave my house; I then listen to the file on my phone by going to corresponding URL.
* [`mediaproxy`](./mediaproxy) to ssh into the server, `youtube-dl`/`ffmpeg` something and host it on a readable link. Has video/audio wrapper that use more of my [personal scripts](https://github.com/seanbreckenridge/dotfiles/) to prompt me to to select format codes, (similar to [`mpvf`](https://github.com/seanbreckenridge/mpvf/)). That way, I can press a keybind, which grabs the URL from my clipboard and re-hosts it on my server.
* [`shorten`](./shorten) creates a shortened url using [this](https://github.com/seanbreckenridge/no-db-static-shorturl)
* [`directories`](./directories) is a helper script sourced at the top of other scripts that defines common application location environment variables

### Applications:

- https://github.com/seanbreckenridge/glue
- https://github.com/seanbreckenridge/mal-id-cache
- https://github.com/seanbreckenridge/mal-notify-bot
- https://github.com/seanbreckenridge/discord-countdown-bot
- https://github.com/seanbreckenridge/mal-unapproved
- https://github.com/seanbreckenridge/docker-jikan
- https://github.com/seanbreckenridge/wca_userinfo
- https://github.com/seanbreckenridge/albums (server)
- https://github.com/seanbreckenridge/todotxt_deadline_notify
- https://github.com/seanbreckenridge/xqc-dvd
- https://github.com/seanbreckenridge/xkcd-favorites
- https://github.com/seanbreckenridge/animeshorts
- https://github.com/seanbreckenridge/subpath-serve
- https://github.com/seanbreckenridge/no-db-static-shorturl
- https://github.com/seanbreckenridge/mnu_gsheets

