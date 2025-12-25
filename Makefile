all: zsh tmux vim tig claude codex

zsh:
	ln -s $(CURDIR)/.zshrc ~/.zshrc
	ln -s $(CURDIR)/.zsh_profile ~/.zsh_profile
	ln -s $(CURDIR)/.zsh.d ~/.zsh.d

tmux:
	ln -s $(CURDIR)/.tmux.conf ~/.tmux.conf
	ln -s $(CURDIR)/.tmux.d ~/.tmux.d

vim:
	ln -s $(CURDIR)/.vimrc ~/.vimrc

tig:
	ln -s $(CURDIR)/.tigrc ~/.tigrc

claude:
	mkdir -p ~/.claude
	ln -s $(CURDIR)/.claude/settings.json ~/.claude/settings.json
	ln -s $(CURDIR)/.claude/statusline.js ~/.claude/statusline.js

codex:
	mkdir -p ~/.codex/rules
	ln -s $(CURDIR)/.codex/AGENTS.md ~/.codex/AGENTS.md
	ln -s $(CURDIR)/.codex/rules/git.rules ~/.codex/rules/git.rules

mac:
	$(CURDIR)/.macos

clean:
	if [ -L ~/.zshrc ]; then unlink ~/.zshrc ; fi
	if [ -L ~/.zsh_profile ]; then unlink ~/.zsh_profile ; fi
	if [ -L ~/.zsh.d ]; then unlink ~/.zsh.d ; fi
	if [ -L ~/.tmux.conf ]; then unlink ~/.tmux.conf ; fi
	if [ -L ~/.tmux.d ]; then unlink ~/.tmux.d ; fi
	if [ -L ~/.vimrc ]; then unlink ~/.vimrc ; fi
	if [ -L ~/.tigrc ]; then unlink ~/.tigrc ; fi
	if [ -L ~/.claude/settings.json ]; then unlink ~/.claude/settings.json ; fi
	if [ -L ~/.claude/statusline.js ]; then unlink ~/.claude/statusline.js ; fi
	if [ -L ~/.codex/AGENTS.md ]; then unlink ~/.codex/AGENTS.md ; fi
	if [ -L ~/.codex/rules/git.rules ]; then unlink ~/.codex/rules/git.rules ; fi