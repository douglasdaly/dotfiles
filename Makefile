#!/usr/bin/env make -f

#
# 	Configuration
#

HOME := /home/doug
CONFIG := .config

#
# 	Recipes
#

.PHONY: help update install \
	update-bash

.DEFAULT-GOAL := help


# - Misc.

help:
	@printf 'Usage: make \033[36m[target]\033[0m\n'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

# - Updates

update: update-start update-bash update-bashit update-neovim update-vim ## Updates these dotfiles from the local system.
	@echo '[INFO] DONE.'

update-start:
	@echo '[INFO] Updating:'

update-bash:
	@echo ' - Bash'
	@cp $(HOME)/.bashrc ./bashrc
	@cp $(HOME)/.profile ./profile
	@cp $(HOME)/.aliases ./aliases
	@cp $(HOME)/.exports ./exports
	@cp $(HOME)/.inputrc ./inputrc

update-bashit:
	@echo ' - Bash-It'
	@cp -r $(HOME)/.bash_it/custom/* ./bash_it/

update-neovim:
	@echo ' - NeoVim'
	@cp -r $(HOME)/$(CONFIG)/nvim/* ./neovim/

update-vim:
	@echo ' - Vim'
	@cp $(HOME)/.vim/vimrc ./vim/
	@cp $(HOME)/.vim/colors/* ./vim/colors/

# - Install

install: install-start install-bash install-bashit install-neovim install-vim ## Installs these dotfiles on the local system.
	@echo '[INFO] Done'

install-start:
	@echo '[INFO] Installing:'

install-bash:
	@echo ' - Bash'
	@cp ./bashrc $(HOME)/.bashrc
	@cp ./profile $(HOME)/.profile
	@cp ./aliases $(HOME)/.aliases
	@cp ./exports $(HOME)/.exports
	@cp ./inputrc $(HOME)/.inputrc

install-bashit:
	@echo ' - Bash-It'
	@cp -r ./bash_it/* $(HOME)/.bash_it/custom/

install-neovim:
	@echo ' - NeoVim'
	@cp -r ./neovim/* $(HOME)/$(CONFIG)/nvim/

install-vim:
	@echo ' - Vim'
	@cp -r ./vim/* $(HOME)/.vim/
