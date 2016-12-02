DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ZSH=zshalias zshenv zshrc
ZSHFILES=$(patsubst %,$(DIR)/%,$(ZSH))
ZSHLINKS=$(patsubst %,$(HOME)/.%,$(ZSH))

.PHONY: install uninstall

install: $(ZSHFILES)
	$(foreach file,$(ZSH),ln -s $(DIR)/$(file) $(HOME)/.$(file);)

uninstall: $(ZSHLINKS)
	$(foreach link,$(ZSHLINKS),unlink $(link);)
