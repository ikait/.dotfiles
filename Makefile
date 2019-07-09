all: .zshrc .zsh_profile .zsh.d hyper

.zshrc:
	ln -s $(CURDIR)/.zshrc ~/.zshrc

.zsh_profile:
	ln -s $(CURDIR)/.zsh_profile ~/.zsh_profile

.zsh.d:
	ln -s $(CURDIR)/.zsh.d ~/.zsh.d

hyper:
	ln -s $(CURDIR)/.hyper.js ~/.hyper.js

mac:
	$(CURDIR)/.macos && $(CURDIR)/.install_dotfiles

clean:
	if [ -L ~/.zshrc ]; then unlink ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then unlink ~/.zsh_profile ; fi
	if [ -L ~/.zsh.d ]; then unlink ~/.zsh.d ; fi
	if [ -L ~/.hyper.js ]; then unlink ~/.hyper.js ; fi
