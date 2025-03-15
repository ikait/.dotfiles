all: zsh tmux vim ghostty

zsh:
	ln -s $(CURDIR)/.zshrc ~/.zshrc
	ln -s $(CURDIR)/.zsh_profile ~/.zsh_profile
	ln -s $(CURDIR)/.zsh.d ~/.zsh.d

tmux:
	ln -s $(CURDIR)/.tmux.conf ~/.tmux.conf
	ln -s $(CURDIR)/.tmux.d ~/.tmux.d

vim:
	ln -s $(CURDIR)/.vimrc ~/.vimrc

ghostty:
	ln -s $(CURDIR)/.config/ghostty/config ~/.config/ghostty/config

mac:
	$(CURDIR)/.macos && $(CURDIR)/.install_dotfiles

clean:
	if [ -L ~/.zshrc ]; then unlink ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then unlink ~/.zsh_profile ; fi
	if [ -L ~/.zsh.d ]; then unlink ~/.zsh.d ; fi
	if [ -L ~/.tmux.conf ]; then unlink ~/.tmux.conf ; fi
	if [ -L ~/.tmux.d ]; then unlink ~/.tmux.d ; fi
	if [ -L ~/.vimrc ]; then unlink ~/.vimrc ; fi
	if [ -L ~/.config/ghostty/config ]; then unlink ~/.config/ghostty/config ; fi
