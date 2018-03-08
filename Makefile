prefix=/usr/local

all:

install:
	mkdir -p $(DESTDIR)$(prefix)/bin
	install -m 755 src/bin/make-www-screenshot.js $(DESTDIR)$(prefix)/bin
	mkdir -p $(DESTDIR)$(prefix)/share/thumbnailers
	install -m 644 src/share/thumbnailers/html.thumbnailer $(DESTDIR)$(prefix)/share/thumbnailers
	sed -i s:_prefix_:$(prefix): $(DESTDIR)$(prefix)/share/thumbnailers/html.thumbnailer

.PHONY: install all

