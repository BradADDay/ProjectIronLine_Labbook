#!/bin/bash

[[ -z "$1" ]] && echo "ERROR: Empty Input, Please enter a commit message." && exit 1 

{
quarto render
}&&
{
git pull
}&&
{
git add -A
}&&
{
git commit -m "$1"
}&&
{
git push
}

