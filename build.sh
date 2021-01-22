#!/usr/bin/env bash
if [ $# -ne 2 ]; then
  echo "Usage: $0 PLATFORM VERSION"
  echo "e.g."
  echo "$0 ubuntu:18.04 3.0.5"
  exit 1
else
  PLATFORM="${1}"
  VERSION="${2}"
  docker build --build-arg VERSION --build-arg PLATFORM -t htop-${PLATFORM} .
  docker cp $(docker create --rm htop-${PLATFORM} sleep 0):/htop-${VERSION} ./htop-${VERSION}-${PLATFORM}
fi
