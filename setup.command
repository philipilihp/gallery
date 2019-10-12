#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")

# Create a duplicate of each photo, and then minify them

# low res version of image
python $SCRIPT_PATH/tools/duplicate.py min
magick mogrify -resize 1024x $SCRIPT_PATH/photos/**/*.jpeg &>/dev/null
magick mogrify -resize 1024x $SCRIPT_PATH/photos/**/*.png &>/dev/null
magick mogrify -resize 1024x $SCRIPT_PATH/photos/**/*.jpg &>/dev/null

magick mogrify -resize 640x $SCRIPT_PATH/photos/**/*.min.jpeg &>/dev/null
magick mogrify -resize 640x $SCRIPT_PATH/photos/**/*.min.png &>/dev/null
magick mogrify -resize 640x $SCRIPT_PATH/photos/**/*.min.jpg &>/dev/null

# placeholder image for lazy loading
python $SCRIPT_PATH/tools/duplicate.py placeholder
magick mogrify -resize 32x $SCRIPT_PATH/photos/**/*.placeholder.jpeg &>/dev/null
magick mogrify -resize 32x $SCRIPT_PATH/photos/**/*.placeholder.png &>/dev/null
magick mogrify -resize 32x $SCRIPT_PATH/photos/**/*.placeholder.jpg &>/dev/null

python $SCRIPT_PATH/tools/setup.py
