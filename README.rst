Sentry package for Debian-based systems
=======================================

This repository contains all you need to create a Sentry
installation package for Debian system.

Package version is retrieved from current sentry release on GitHub.

It automatically creates virtual environment (with dh_virtualenv)
and installs all the requirements. Installation path is
/var/lib/sentry.

Provided are example configurations for WSGI modules of Apache and nginx.
