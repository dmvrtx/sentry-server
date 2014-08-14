# -*- coding: utf-8 -*-
# Sentry server configuration
# Real settings are only imported here - change them in server.conf.py

# Importing sentry settings
from server.conf.py import *

# Importing server libraries to run as a WSGI script
from sentry.conf.server import *
