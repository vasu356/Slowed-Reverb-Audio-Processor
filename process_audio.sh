#!/bin/bash

# Hardcoded input and output directories
#Please enter the input directory where the songs are stored that need to be converted to slowed reverb, and 
#specify the output directory where the processed slowed reverb songs should be saved in below.

input_directory=""
output_directory=""

# Process all MP3 files in the input directory
for input_file in "$input_directory"/*.mp3; do
    # Extract song name without extension
    song_name=$(basename -- "$input_file")
    song_name="${song_name%.*}"

    output_file="${song_name}_slowed_reverb.mp3"
    slowdown_factor=0.75
    reverberance_factor=80

    # Install the libsox-fmt-mp3 package
    sudo apt-get install libsox-fmt-mp3

    # Step 1: Slow down the audio and add reverb
    sox "$input_file" -r 44100 -e signed-integer -b 16 -C 320 "${output_directory}/${output_file}" speed $slowdown_factor reverb $reverberance_factor
done
