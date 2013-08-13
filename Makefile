# ZSH_CONF_DIRECTORY = ~/.zsh.d
NPM_COMPLETION     = ~/.npm-completion

all: ~/.zshrc ~/.zsh_profile

~/.zshrc: $(NPM_COMPLETION)
	ln -s $(CURDIR)/zshrc.sh ~/.zshrc

~/.zsh_profile:
	ln -s $(CURDIR)/zsh_profile.sh ~/.zsh_profile

$(NPM_COMPLETION):
	npm completion > $(NPM_COMPLETION)

clean:
	if [ -L ~/.zshrc ]; then rm ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then rm ~/.zsh_profile ; fi
	if [ -L $(NPM_COMPLETION) ]; then rm $(NPM_COMPLETION) ; fi
