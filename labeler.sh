#!/bin/bash

BASE_SHA=$INPUT_BASE_SHA
HEAD_SHA=$INPUT_HEAD_SHA
REPO=$INPUT_REPOSITORY
PR_NUMBER=$INPUT_PR_NUMBER

# Compute the number of lines changed in the PR
LINES_CHANGED=$(git diff --shortstat $BASE_SHA..$HEAD_SHA | awk '{print $4}')

# Determine the label based on the size
if [ "$LINES_CHANGED" -lt "10" ]; then
  LABEL="small"
elif [ "$LINES_CHANGED" -lt "100" ]; then
  LABEL="medium"
else
  LABEL="large"
fi

# Use GitHub API to add the label
curl -sSL \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -X POST \
  -d "{\"labels\":[\"$LABEL\"]}" \
  "https://api.github.com/repos/$REPO/issues/$PR_NUMBER/labels"
