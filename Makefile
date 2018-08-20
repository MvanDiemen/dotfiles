default_target: help

help:
	@echo "all          # Sets up everything"
	@echo "vim          # Sets up Vim"
	@echo "tmux         # Copies the .tmux.conf file to ~/"
	@echo "git          # Sets the global .gitignore"
	@echo "fonts        # Configures X11 to properly render fonts"
	@echo "pry          # Creates the configuration files for Pry"
	@echo "keybindings  # Configures keybindings"
	@echo "fish         # Configures Fish"
	@echo "vscode       # Configures Visual Studio Code"
	@echo "termite      # Configures Termite"
	@echo "i3           # Configures i3"
	@echo "polybar      # Configures polybar"
	@echo "terminator   # Configures Terminator"
	@echo "brew         # Installs and configures Homebrew"
	@echo "gem          # Sets gem doc settings"
	@echo "awareness    # Installs Awareness in the Application folder"
	@echo "ruby-version # Installs the version from the ruby-version file"
	@echo "xresources   # Setup Xresources"

all:
	@make vim
	@make tmux
	@make git
	@make gitmac
	@make fonts
	@make pry
	@make termite
	@make i3
	@make polybar
	@make keybindings
	@make gem
	@make ruby-version
	@make xresources

vim:
	@ln -s ${PWD}/.vim ${HOME}/.vim
	@ln -s ${PWD}/.vimrc ${HOME}/.vimrc
	@ln -s ${PWD}/.gvimrc ${HOME}/.gvimrc
	@ln -s ${PWD}/.vimrc.after ${HOME}/.vimrc.after
	@ln -s ${PWD}/.vimrc ${HOME}/.config/nvim/init.vim

tmux:
	@ln -s ${PWD}/.tmux.conf ${HOME}/.tmux.conf

git:
	@ln -s ${PWD}/.gitignore_global ${HOME}/.gitignore_global
	@ln -s ${PWD}/.gitconfigmac ${HOME}/.gitconfig
	@ln -s ${PWD}/.ignore ${HOME}/.ignore

fonts:
	@ln -s ${PWD}/.Xdefaults ${HOME}/.Xdefaults
	@ln -s ${PWD}/.fonts.conf ${HOME}/.fonts.conf

pry:
	@ln -s ${PWD}/.pryrc ${HOME}/.pryrc

keybindings:
	@ln -s ${PWD}/.Xmodmap ${HOME}/.Xmodmap
	@xmodmap ${HOME}/.Xmodmap

fish:
	@ln -s ${PWD}/.config/fish ${HOME}/.config/

vscode:
	@ln -s ${PWD}/.config/Code ${HOME}/.config/

polybar:
	@ln -s ${PWD}/.config/polybar ${HOME}/.config/

termite:
	@ln -s ${PWD}/.config/termite ${HOME}/.config/

terminator:
	@ln -s ${PWD}/.config/terminator ${HOME}/.config/

i3:
	@ln -s ${PWD}/.config/i3 ${HOME}/.config/
	@ln -s ${PWD}/.i3status.conf ${HOME}/

brew:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew install vim chruby chruby-fish node ragel the_silver_searcher tree ruby-install

gem:
	@ln -s ${PWD}/.gemrc ${HOME}/.gemrc

awareness:
	@ln -s ${PWD}/Awareness.app /Applications/Awareness.app

ruby-version:
	@ln -s ${PWD}/.ruby-version ${HOME}/.ruby-version
	for file in ${HOME}/.ruby-version; do \
		@ruby-install "$${file}"; \
	done ;

xresources:
	@ln -s ${PWD}/.Xresources ${HOME}/.Xresources
