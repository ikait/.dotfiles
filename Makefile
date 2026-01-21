HOME_DIR := $(HOME)

LINK_ZSH := \
	.zshrc \
	.zsh_profile \
	.zsh.d
LINK_TMUX := \
	.tmux.conf \
	.tmux.d
LINK_VIM := .vimrc
LINK_TIG := .tigrc
LINK_CLAUDE := \
	.claude/settings.json \
	.claude/statusline.js
LINK_CODEX := \
	.codex/AGENTS.md \
	.codex/rules/git.rules
LINK_GHOSTTY := .config/ghostty/config

ALL_LINKS := $(LINK_ZSH) $(LINK_TMUX) $(LINK_VIM) $(LINK_TIG) \
	$(LINK_CLAUDE) $(LINK_CODEX) $(LINK_GHOSTTY)

define link_files
	for f in $1; do \
		dest="$(HOME_DIR)/$$f"; \
		if [ -d "$$dest" ] && [ ! -L "$$dest" ]; then \
			echo "skip: $$dest is a directory"; \
			continue; \
		fi; \
		mkdir -p "$$(dirname "$$dest")"; \
		ln -sf "$(CURDIR)/$$f" "$$dest"; \
	done
endef

all: zsh tmux vim tig claude codex

zsh:
	$(call link_files,$(LINK_ZSH))

tmux:
	$(call link_files,$(LINK_TMUX))

vim:
	$(call link_files,$(LINK_VIM))

tig:
	$(call link_files,$(LINK_TIG))

claude:
	$(call link_files,$(LINK_CLAUDE))

codex:
	$(call link_files,$(LINK_CODEX))

ghostty:
	$(call link_files,$(LINK_GHOSTTY))

mac:
	$(CURDIR)/.macos

clean:
	for f in $(ALL_LINKS); do \
		if [ -L "$(HOME_DIR)/$$f" ]; then unlink "$(HOME_DIR)/$$f"; fi; \
	done