#!/bin/zsh

# Iterates throuhg all files in current directory that match the sub-string in
# argument 1, and then aplies command 2.
# Example usage: ./find-and-apply.zsh deepseek kaf
# This will apply kaf {filename} for every file with deepseek in the name in the current dir
for file in *$1*; do 
  eval "$2 \"${file}\""
done
