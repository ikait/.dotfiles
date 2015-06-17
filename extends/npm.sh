if type npm > /dev/null 2>&1; then
  NPM_COMPLETION=~/.npm-completion
  npm completion > $NPM_COMPLETION

  export PATH=/usr/local/share/npm/bin:$PATH
  export PATH=./node_modules/.bin:$PATH
fi
