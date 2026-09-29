#!/bin/bash

# Checking if input 1 is empty, throwing an error if so
[[ -z "$1" ]] && echo "ERROR: Empty Input, Please enter a commit message." && exit 1 

# Render the book
{
quarto render
}&&
# Pulling from GitHub
{
git pull
}&&
# Staging all changes to push to GitHub
{
git add -A
}&&
# Committing, using the first input as the commit message
{
git commit -m "$1"
}&&
# Pushing changes to GitHub
{
git push
}

