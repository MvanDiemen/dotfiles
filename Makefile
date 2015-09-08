default_target: help

help:
	@echo "all         # Sets up everything"
	@echo "vim         # Sets up Vim"
	@echo "tmux        # Copies the .tmux.conf file to ~/"
	@echo "git         # Sets the global .gitignore"
	@echo "gitmac      # Sets the global .gitignore for mac"
	@echo "fonts       # Configures X11 to properly render fonts"
	@echo "pry         # Creates the configuration files for Pry"
	@echo "keybindings # Configures keybindings"
	@echo "fish        # Configures Fish"

all:
	@make vim
	@make tmux
	@make git
	@make gitmac
	@make fonts
	@make pry
	@make keybindings

vim:
	@git submodule init
	@git submodule update
	@ln -s ${PWD}/.vim ${HOME}/.vim
	@ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	@ln -s ${PWD}/.gvimrc ${HOME}/.gvimrc
	@ln -s ${PWD}/.vimrc.after ${HOME}/.vimrc.after

tmux:
	@ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf

gitmac:
	@cp .gitignore_global ${HOME}/.gitignore_global
	@cp .gitconfigmac ${HOME}/.gitconfig

git:
	@cp .gitignore_global ${HOME}/.gitignore_global
	@cp .gitconfig ${HOME}/.gitconfig

fonts:
	@cp .Xdefaults ${HOME}/.Xdefaults
	@cp .fonts.conf ${HOME}/.fonts.conf

pry:
	@ln -s ${PWD}/.pryrc ${HOME}/.pryrc

keybindings:
	@ln -s ${PWD}/.Xmodmap ${HOME}/.Xmodmap
	@xmodmap ${HOME}/.Xmodmap

fish:
	@ln -s ${PWD}/.config/fish ${HOME}/.config/
