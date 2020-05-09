#!/usr/bin/env make -f

#
# 	Configuration
#

HOME := /home/doug
CONFIG := .config

#
# 	Recipes
#

.DEFAULT-GOAL := help


# - Misc.

.PHONY: help
help:
	@printf 'Usage: make \033[36m[target]\033[0m\n'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

# - Updates

.PHONY: update
update: update-start update-bash update-bashit update-neovim update-vim ## Updates these dotfiles from the local system.
	@echo '[INFO] DONE.'

.PHONY: update-start
update-start:
	@echo '[INFO] Updating:'

.PHONY: update-bash
update-bash:
	@echo ' - Bash'
	@cp $(HOME)/.bashrc ./bashrc
	@cp $(HOME)/.profile ./profile
	@cp $(HOME)/.bash_aliases ./bash_aliases
	@cp $(HOME)/.exports ./exports
	@cp $(HOME)/.inputrc ./inputrc

.PHONY: update-bashit
update-bashit:
	@echo ' - Bash-It'
	@cp -r $(HOME)/.bash_it/custom/* ./bash_it/

.PHONY: update-neovim
update-neovim:
	@echo ' - NeoVim'
	@cp -r $(HOME)/$(CONFIG)/nvim/* ./neovim/

.PHONY: update-vim
update-vim:
	@echo ' - Vim'
	@cp $(HOME)/.vim/vimrc ./vim/
	@cp $(HOME)/.vim/colors/* ./vim/colors/

# - Install

.PHONY: install
install: install-start install-bash install-bashit install-neovim install-vim ## Installs these dotfiles on the local system.
	@echo '[INFO] Done'

.PHONY: install-start
install-start:
	@echo '[INFO] Installing:'

.PHONY: install-bash
install-bash:
	@echo ' - Bash'
	@cp ./bashrc $(HOME)/.bashrc
	@cp ./profile $(HOME)/.profile
	@cp ./bash_aliases $(HOME)/.bash_aliases
	@cp ./exports $(HOME)/.exports
	@cp ./inputrc $(HOME)/.inputrc

.PHONY: install-bashit
install-bashit:
	@echo ' - Bash-It'
	@cp -r ./bash_it/* $(HOME)/.bash_it/custom/

.PHONY: install-neovim
install-neovim:
	@echo ' - NeoVim'
	@cp -r ./neovim/* $(HOME)/$(CONFIG)/nvim/

.PHONY: install-vim
install-vim:
	@echo ' - Vim'
	@cp -r ./vim/* $(HOME)/.vim/
