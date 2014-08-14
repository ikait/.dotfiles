# ZSH_CONF_DIRECTORY = ~/.zsh.d
NPM_COMPLETION     = ~/.npm-completion

all: ~/.zshrc ~/.zsh_profile ~/.zsh.d

~/.zshrc: $(NPM_COMPLETION)
	ln -s $(CURDIR)/zshrc.sh ~/.zshrc

~/.zsh_profile:
	ln -s $(CURDIR)/zsh_profile.sh ~/.zsh_profile

~/.zsh.d:
	ln -s $(CURDIR)/ ~/.zsh.d

$(NPM_COMPLETION):
	npm completion > $(NPM_COMPLETION)

clean:
	if [ -e ~/.zshrc ]; then rm ~/.zshrc ; fi
	if [ -e ~/.zsh_profile ]; then rm ~/.zsh_profile ; fi
	if [ -e ~/.zsh.d ]; then rm ~/.zsh.d ; fi
	if [ -e $(NPM_COMPLETION) ]; then rm $(NPM_COMPLETION) ; fi
