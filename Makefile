DESTDIR=/usr/local
PREFIX=/usr/local

all:

install:
	mkdir -p $(DESTDIR)/bin
	install -m 755 src/bin/make-www-screenshot.js $(DESTDIR)/bin
	mkdir -p $(DESTDIR)/share/thumbnailers
	install -m 644 src/share/thumbnailers/html.thumbnailer $(DESTDIR)/share/thumbnailers
	sed -i s:_prefix_:$(PREFIX): $(PREFIX)/share/thumbnailers/html.thumbnailer

.PHONY: install all

