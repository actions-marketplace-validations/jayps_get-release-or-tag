#!/usr/bin/env bash

tag="${GITHUB_SHA}"

if [ "${GITHUB_EVENT_NAME}" == "release" ]; then
  ref="${GITHUB_REF}"
  tag=$(echo $GITHUB_REF | sed 's/refs\/tags\///g')
fi

echo "tag=$tag" >> $GITHUB_OUTPUT