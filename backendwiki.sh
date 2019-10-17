#!/bin/bash

case "$1" in
    develop)
	type docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is required but it's not installed.  Aborting."; exit 1; }
	docker-compose build docnado-local && docker-compose run docnado-local
	;;
    build)
	type docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is required but it's not installed.  Aborting."; exit 1; }
	docker-compose build docnado-build && docker-compose run docnado-build
	;;
    generate)
	type docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose is required but it's not installed.  Aborting."; exit 1; }
	docker-compose build docnado-gen && docker-compose run docnado-gen
	;;
  *)
	echo "Usage: backendwiki.sh {develop|build|generate}" >&2
	exit 1
	;;
esac

exit 0
