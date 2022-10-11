#!/bin/bash

echo "%%tana%%"
IFS=$'\n'
todos=$(things-cli --json today  | jq -r '.[].title')
for todo in $todos; do
  echo "- [ ] $todo #things3"
  uuid=$(things-cli --json today | jq -r ".[] | select(.title==\"${todo}\") | .uuid")
  echo "  - uuid:: $uuid"
  project=$(things-cli --json today | jq -r ".[] | select(.title==\"${todo}\") | .project_title")
  if [[ $project != "null" ]]; then
    echo "  - Project:: $project"
  fi
done

