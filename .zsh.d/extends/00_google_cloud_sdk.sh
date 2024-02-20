# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi

# パス追加
if [ -e $HOME/.google-cloud-sdk/bin/gcloud ]; then
  export PATH="$HOME/.google-cloud-sdk/bin:$PATH"
fi

