DESTDIR=/
BUILDIR=$(CURDIR)/build
PROJECT=sentry-server
SENTRY_TMP_PATH=/tmp/sentry_version
SENTRY_SETUP_URL=https://pypi.python.org/pypi/sentry/json
	VERSION=$(shell wget -N -q -O $(SENTRY_TMP_PATH) $(SENTRY_SETUP_URL) && grep -o -e "\"version\": \"[-0-9a-zA-Z\.]\+\"" $(SENTRY_TMP_PATH) | grep -o '[0-9][-0-9a-zA-Z\.]\+')

all:
	@echo "make source - Create source package"
	@echo "make install - Install on local system"
	@echo "make builddeb - Generate a deb package"
	@echo "make clean - Get rid of scratch and byte files"

source:
	@sed -i -e "s/version='[-0-9\.a-zA-Z]\+',/version='$(VERSION)',/" setup.py
	@tar -czf $(CURDIR)/../$(PROJECT)_$(VERSION).orig.tar.gz project debian docs
	@rm -rf $(BUILDIR)

install:
	make source

builddeb:
	make clean
	@dch --package sentry-server -v $(VERSION)
	make source
	@sudo mk-build-deps -ri 
	@dpkg-buildpackage -i -I -uc -us -rfakeroot

clean:
	@rm -rf build/ MANIFEST
	@rm -rf $(CURDIR)/../$(PROJECT)*.orig.tar.gz
	@find . -name '*.pyc' -delete
