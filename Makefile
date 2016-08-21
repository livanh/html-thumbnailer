PREFIX=/usr/local

install:
	install -m 755 src/bin/make-www-screenshot.js $(PREFIX)/bin
	install -m 644 src/share/thumbnailers/html.thumbnailer $(PREFIX)/share/thumbnailers
	sed -i s:_prefix_:$(PREFIX): $(PREFIX)/share/thumbnailers/html.thumbnailer

.PHONY: install
