#!/bin/sh

set -e

size=$(jq -r '.pull_request.additions + .pull_request.deletions' $GITHUB_EVENT_PATH)
issue_url=$(jq -r .pull_request.issue_url $GITHUB_EVENT_PATH)
labels=$(jq -r '.pull_request.labels[].name | select(. | startswith("size/"))' $GITHUB_EVENT_PATH)

if [ $size -le 10 ]; then
    label="size/XS"
elif [ $size -le 30 ]; then
    label="size/S"
elif [ $size -le 100 ]; then
    label="size/M"
elif [ $size -le 500 ]; then
    label="size/L"
elif [ $size -le 1000 ]; then
    label="size/XL"
elif [ $size -gt 1000 ]; then
    label="size/XXL"
fi

if [ "$label" = "$labels" ]; then
  exit 78
fi

for name in $labels
do
  curl --silent --show-error \
    --header "Authorization: token $GITHUB_TOKEN" \
    --header "Content-Type: application/json" \
    --request DELETE \
    "$issue_url/labels/$name"
done

curl --silent --show-error \
  --header "Authorization: token $GITHUB_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"labels\":[\"$label\"]}" \
  "$issue_url/labels"
