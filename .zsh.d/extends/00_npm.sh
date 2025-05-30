if type npm > /dev/null 2>&1; then
  NPM_COMPLETION=~/.npm-completion
  npm completion > $NPM_COMPLETION

  export PATH=$PATH:./node_modules/.bin
  export PATH=$PATH:`npm prefix --location=global`/bin
fi
