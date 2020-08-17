DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ZSH=zshalias zshenv zshrc
ZSHFILES=$(patsubst %,$(DIR)/%,$(ZSH))
ZSHLINKS=$(patsubst %,$(HOME)/.%,$(ZSH))
CFGDIR=$(HOME)/.local/share/zsh-cfg

.DEFAULT_GOAL:=install
.PHONY: fetch-deps install uninstall default

fetch-deps:
	mkdir -p $(CFGDIR)
	wget https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash \
		-O $(CFGDIR)/wp-completion.bash

install: fetch-deps $(ZSHFILES)
	$(foreach file,$(ZSH),ln -s $(DIR)/$(file) $(HOME)/.$(file);)

uninstall:
	$(foreach link,$(ZSHLINKS),unlink $(link);)
