# ZSH_CONF_DIRECTORY = ~/.zsh.d
NPM_COMPLETION     = ~/.npm-completion

all: ~/.zshrc ~/.zsh_profile ~/.zsh.d

~/.zshrc: $(NPM_COMPLETION)
	ln -sf $(CURDIR)/zshrc.sh ~/.zshrc

~/.zsh_profile:
	ln -sf $(CURDIR)/zsh_profile.sh ~/.zsh_profile

~/.zsh.d:
	ln -sf $(CURDIR)/ ~/.zsh.d

$(NPM_COMPLETION):
	if ! type npm > /dev/null 2>&1; then npm completion > $(NPM_COMPLETION) ; fi
	
clean:
	if [ -e ~/.zshrc ]; then rm -f ~/.zshrc ; fi
	if [ -e ~/.zsh_profile ]; then rm -f ~/.zsh_profile ; fi
	if [ -e ~/.zsh.d ]; then rm -f ~/.zsh.d ; fi
	if [ -e $(NPM_COMPLETION) ]; then rm -f $(NPM_COMPLETION) ; fi
