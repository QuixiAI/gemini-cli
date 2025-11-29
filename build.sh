#!/bin/bash

npm ci

set -e
npm run build
npm run bundle

# Clean up stale npm link artifacts that can cause ENOTDIR errors
NPM_GLOBAL_GOOGLE="$(npm root -g)/@google"
if [ -d "$NPM_GLOBAL_GOOGLE" ]; then
  find "$NPM_GLOBAL_GOOGLE" -maxdepth 1 -name '.gemini-cli-*' -exec rm -rf {} + 2>/dev/null
fi

npm link

