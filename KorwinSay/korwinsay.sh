#!/bin/bash

# Path to file with quotes
FILE="./0.txt"
# Get random line from file
TEXT=$(shuf -n 1 $FILE)
# Print line to terminal
| sed -e 's/^/\t/'
echo $TEXT