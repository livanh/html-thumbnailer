PREFIX=/usr/local

PACKAGE_NAME=html-thumbnailer
PACKAGE_VERSION=0.1

install:
	install -m 755 src/bin/make-www-screenshot.js $(PREFIX)/bin
	install -m 644 src/share/thumbnailers/html.thumbnailer $(PREFIX)/share/thumbnailers
	sed -i s:_prefix_:$(PREFIX): $(PREFIX)/share/thumbnailers/html.thumbnailer

deb:
	mkdir -p $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN
	cp debian/control $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN
	touch $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN/conffiles
	mkdir -p $(PACKAGE_NAME)_$(PACKAGE_VERSION)/usr
	cp -r src/* $(PACKAGE_NAME)_$(PACKAGE_VERSION)/usr
	fakeroot dpkg-deb --build $(PACKAGE_NAME)_$(PACKAGE_VERSION)
	rm -r $(PACKAGE_NAME)_$(PACKAGE_VERSION)

.PHONY: install
