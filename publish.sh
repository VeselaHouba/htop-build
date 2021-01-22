#!/usr/bin/env bash
if [ $# -ne 4 ]; then
  echo "Usage $0 REPO_OWNER REPO_NAME TAG FILENAME"
  exit 1
fi
if [ -z ${GITHUB_TOKEN} ]; then
  echo "GITHUB_TOKEN variable has to be set"
  exit 1
fi

set -e
curl https://gist.githubusercontent.com/stefanbuck/ce788fee19ab6eb0b4447a85fc99f447/raw/dbadd7d310ce8446de89c4ffdf1db0b400d0f6c3/upload-github-release-asset.sh > upload-github-release-asset.sh
chmod +x upload-github-release-asset.sh
./upload-github-release-asset.sh \
  github_api_token="${GITHUB_TOKEN}" \
  owner="${1}" \
  repo="${2}" \
  tag="${3}" \
  filename="${4}"
