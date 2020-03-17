## vps

Scripts used for installing/managing/restarting/monitoring processes on my VPS.

This is currently hosted on scaleway (Ubuntu), though it should be OS/provider agnostic.

* [install](./install) clones and sets up environments for each application. Checks that you have corresponding commands/packages installed and that required crededential/files are in the right location, installs virtual environments/packages for each application.
* [restart](./restart) kills all screen and the docker compose instances, and restarts each of them
* [logs](./logs) streams the logs from all applications
* [backup](./backup) copies cache/token files to a tar.gz so they can be backed up
* [directories](./directories) is a helper script sourced at the top of other scripts that defines common application location environment variables

Uses [screen](https://www.gnu.org/software/screen/) to run background processes. (Currently using screen version 4.08.02 23-Oct-17)

Jikan is setup using [this](https://github.com/seanbreckenridge/docker-jikan) docker-compose config.
