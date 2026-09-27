#!/bin/bash

PS3="Select a branch to checkout to (or Ctrl+C to cancel): "

branches=($(git branch --sort=-committerdate --format='%(refname:short)'))

select branch in "${branches[@]}"; do
    if [ -n "$branch" ]; then
        git checkout "$branch"
        break
    else
        echo "Invalid selection."
    fi
done