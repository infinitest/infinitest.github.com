#!/bin/bash

convert $1 -resize 256x256! -transparent white favicon-256.png

for size in 16 32 64 128; do
	convert favicon-256.png -resize ${size}x${size} favicon-${size}.png
done

convert favicon-{16,32,64,128,256}.png +dither -colors 256 favicon.ico

convert favicon-256.png -resize 57x57 apple-touch-icon.png
for size in 72 114; do
	convert favicon-256.png -resize ${size}x${size} apple-touch-icon-${size}x${size}.png
done

rm -rf favicon-{16,32,64,128,256}.png