# Sentry package for Debian-based systems

This repository contains almost all you need to create a Sentry installation package for Debian system.

Package version is retrieved from current `sentry` release on PyPi.

It automatically creates a python virtual environment (with `dh-virtualenv`) and installs all the requirements. Installation path is `/var/lib/sentry-server`.

Provided are example configurations for [u]WSGI modules of Apache and nginx.

## Creating a package

First you should install `dh-virtualenv` from (GitHub repository)[https://github.com/spotify/dh-virtualenv]. Follow the installation instuctrions on (read the docs)[http://dh-virtualenv.readthedocs.org/en/latest/tutorial.html#step-1-install-dh-virtualenv].

After that you can just run `make builddeb`. It will do the following:
 * Request PyPi of current sentry version and update `setup.py` and `debian/changelog` files according to that.
 * Create a virtual environment (using `dh-virtualenv`) and install `sentry` itself and all the requirements (you can see them in `requirements.txt`).
 * Update virtual environment with an example sentry configuration file.
 * Pack all the environment into debian package for easier installation.
 
 *Note:* You should only create package on the same system version which you intended to install on. E.g. if you run installation on Ubuntu 14.04 LTS it most probably won't work or even install on Debian Wheezy.
 
 ## Installing sentry-server
 
  # Run `dpkg -i sentry-server_xxx_all.deb`.
  # Update `/var/lib/sentry-server/project/sentry.conf.py` with valid database settings (change other settings according to your taste).
  # Follow the steps in (sentry installation guide)[https://sentry.readthedocs.org/en/latest/quickstart/index.html#running-migrations].
  # Use configuration examples in `/usr/share/doc/sentry-server` to set up your web server virtual host pointing to sentry installation.
