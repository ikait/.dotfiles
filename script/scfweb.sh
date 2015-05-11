func scfweb() {

#
echo "make package.json <equivalent to npm init>"

cat << EOS > package.json
{
  "name": "Project",
  "description": "",
  "version": "0.0.1",
  "homepage": "",
  "author": {
    "name": "ikait",
    "email": "t@ikai.tokyo"
  },
  "repository": {
    "type": "git",
    "url": ""
  },
  "bugs": {
    "url": ""
  },
  "licenses": "MIT",
  "main": "index.js",
  "keywords": [

  ]
}
EOS

npm install \
  grunt \
  bower \
  grunt-bower-task \
  grunt-contrib-sass \
  grunt-contrib-uglify \
#  grunt-contrib-watch \
  grunt-este-watch \
  --save-dev

bower install \
  backbone \
  bootstrap-sass \
  --save-dev

grunt ## 途中

}
