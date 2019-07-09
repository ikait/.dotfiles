all: zsh dotfiles hyper

zshrc:
	ln -s $(CURDIR)/.zshrc ~/.zshrc

zsh_profile:
	ln -s $(CURDIR)/.zsh_profile ~/.zsh_profile

hyper:
	ln -s $(CURDIR)/.hyper.js ~/.hyper.js

dotfiles:
	ln -s $(CURDIR)/ ~/.dotfiles

mac:
	$(CURDIR)/.macos && $(CURDIR)/.install_dotfiles

clean:
	if [ -L ~/.zshrc ]; then unlink ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then unlink ~/.zsh_profile ; fi
	if [ -L ~/.hyper.js ]; then unlink ~/.hyper.js ; fi
	if [ -L ~/.zsh.d ]; then unlink ~/.zsh.d ; fi
