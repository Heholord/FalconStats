#!/bin/sh

# @author   https://www.reddit.com/user/LookAtMyKeyboard

OUTPUT="$(zpool status -xv)"

echo "\nZPOOL Status: ${OUTPUT}"
