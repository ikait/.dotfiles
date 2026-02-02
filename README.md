# .dotfiles

## Install

```zsh
# If macOS, install Xcode Command Line Tools (ignore if already installed)
xcode-select --install || true

# Clone repo + submodules
git clone --depth 1 --recurse-submodules https://github.com/ikait/.dotfiles.git ~/.dotfiles

# Move into repo
cd ~/.dotfiles

# Create symlinks for config files
make all

# If macOS, Apply macOS settings (omit if not needed)
make mac
```

## Uninstall

```zsh
cd ~/.dotfiles  # Move into repo
make clean  # Remove created symlinks
```
