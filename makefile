ZSHFILES=.zshalias .zshenv .zshrc

install: $(ZSHFILES)
	cp $(ZSHFILES) $(HOME)

uninstall:
	cd $(HOME); rm $(ZSHFILES)
