DIR:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ZSH=zshalias zshenv zshrc
ZSHFILES=$(patsubst %,$(DIR)/%,$(ZSH))
ZSHLINKS=$(patsubst %,$(HOME)/.%,$(ZSH))
GITDIR=$(HOME)/.local/share/git-core/contrib/completion

.DEFAULT_GOAL:=install
.PHONY: fetch-deps install uninstall default

fetch-deps:
	mkdir -p $(GITDIR)
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
		-O $(GITDIR)/git-prompt.sh

install: fetch-deps $(ZSHFILES)
	$(foreach file,$(ZSH),ln -s $(DIR)/$(file) $(HOME)/.$(file);)

uninstall:
	$(foreach link,$(ZSHLINKS),unlink $(link);)
