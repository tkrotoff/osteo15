#!/bin/sh

find ./assets -type f -name "*.jpg" -exec jpegoptim --strip-all {} \;
find ./assets -type f -name "*.png" -exec optipng -o7 {} \;
