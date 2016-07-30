DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ZSH=.zshalias .zshenv .zshrc
ZSHFILES=$(patsubst %,$(DIR)/%,$(ZSH))
ZSHLINKS=$(patsubst %,$(HOME)/%,$(ZSH))

install: $(ZSHFILES)
	ln -s $(ZSHFILES) $(HOME)

uninstall: $(ZSHLINKS)
	rm $(ZSHLINKS)
