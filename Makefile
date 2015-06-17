# ZSH_CONF_DIRECTORY = ~/.zsh.d

all: ~/.zshrc ~/.zsh_profile ~/.zsh.d

~/.zshrc: 
	ln -s $(CURDIR)/zshrc.sh ~/.zshrc

~/.zsh_profile:
	ln -s $(CURDIR)/zsh_profile.sh ~/.zsh_profile

~/.zsh.d:
	ln -s $(CURDIR)/ ~/.zsh.d

clean:
	if [ -L ~/.zshrc ]; then unlink ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then unlink ~/.zsh_profile ; fi
	if [ -L ~/.zsh.d ]; then unlink ~/.zsh.d ; fi
