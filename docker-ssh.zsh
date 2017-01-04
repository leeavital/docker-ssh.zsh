function docker-ssh () {
  if [[ $# -eq 0 ]]
  then
    echo "expected argument"
  else
    local host
    host=$1
    docker exec -it  $host /bin/bash
  fi
}

function _d_containers() {
  local -a completions
  for i in $(docker ps --format '{{.Names}}')
  do
    completions+=( $i )
  done
  _describe 'values' completions
}

compdef '_d_containers' docker-ssh
