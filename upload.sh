#!/bin/bash

# Usage
usage() {
  echo ""
  echo "Usage: $0 <commit message>"
  echo "  Renders a quarto document and pushes it to GitHub."
  echo "Notes:"
  echo "  Assumes that the document files are in the same directory as the script."
  echo "  Assumes that the folder is a GitHub repository"
  exit 1  # Exit with an error code (non-zero)
}

# Checking if input 1 is empty, throwing an error if so
[[ -z "$1" ]] && echo "ERROR: Empty Input, Please enter a commit message." && usage 

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

