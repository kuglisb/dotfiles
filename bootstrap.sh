#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "bootstrap-win.sh" \
    --exclude "brew.sh" \
    --exclude "README.md" \
    --exclude "LICENSE.md" \
    -avh --no-perms . ~;
