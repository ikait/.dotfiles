function docker-start () {
  PATH_DOCKER_START="/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"
  
  if [ -e $PATH_DOCKER_START ]; then
    eval `docker-machine env default`
    . $PATH_DOCKER_START
  else
    echo 'Docker Toolbox is not installed.'
    echo 'https://www.docker.com/toolbox'
  fi
}

