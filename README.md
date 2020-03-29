# vps

Scripts used for installing/managing/restarting/monitoring processes on my VPS.

Uses [forever](https://github.com/foreversd/forever) to run background processes.

The [forever-webui](https://github.com/seanbreckenridge/forever-webui) allows you to restart those processes/view logs from a web console.

* Puts application code into `~/code`
* Centralizes logs in `~/logs`

This runs on an ubuntu server, but it should be OS agnostic. `install` will throw a fatal error if I'm missing any required commands.

* [`vps_install`](./vps_install) clones and sets up environments for each application. Checks that you have corresponding commands/packages installed and that required crededential/files are in the right location, installs virtual environments/packages for each application.
* [`restart`](./restart) kills all forever processes and restarts each of them
* [`logs`](./logs) streams the logs from all applications
* [`truncate_logs`](./truncate_logs) safely truncates the log files down to 10000 lines each
* [`backup`](./backup) copies cache/token files to a tar.gz so they can be backed up. [run every few hours w/ cron](https://gist.github.com/seanbreckenridge/191556c41f0ebd86e7dbec8a8e929fbf)
* [`generate_static_sites`](./generate_static_sites) builds my static websites and places them in `/var/www/html`.
* [`directories`](./directories) is a helper script sourced at the top of other scripts that defines common application location environment variables

### Applications:

- https://github.com/seanbreckenridge/mal-id-cache
- https://github.com/seanbreckenridge/mal-notify-bot
- https://github.com/seanbreckenridge/discord-countdown-bot
- https://github.com/seanbreckenridge/mal-unapproved
- https://github.com/seanbreckenridge/docker-jikan
- https://github.com/seanbreckenridge/forever-webui
- https://github.com/seanbreckenridge/foreverjs-list
- https://github.com/seanbreckenridge/wca_userinfo
