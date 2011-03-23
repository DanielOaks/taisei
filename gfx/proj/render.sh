#!/bin/sh

# ** Render projectiles from svg ** #
#
# requires imagemagick

for f in *_auto.svg; do
	convert \( $f -channel G -separate \( $f -channel B -separate \) +append \) \
		\( +clone -colorspace HSL -channel B \) \
		-channel A -combine ${f%_auto.*}.png	
done
