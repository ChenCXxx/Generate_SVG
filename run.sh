#!/bin/bash

INPUT_PATH="inputs"

if [ ! -d "$INPUT_PATH" ]; then
    echo "No inputs folder"
    exit 1
fi

found=0

for filepath in "$INPUT_PATH"/*.txt; do
    # Skip if no txt files exist
    [ -e "$filepath" ] || continue

    filename=$(basename -- "$filepath")
    name="${filename%.*}"
    name=$(echo "$name" | xargs) # trim whitespace

    # Check if name is exactly a number
    if [[ "$name" =~ ^[0-9]+$ ]]; then
        # If it's a number, check if it's between 21 and 40
        if [ "$name" -ge 21 ] && [ "$name" -le 40 ]; then
            should_run=true
        else
            should_run=false
        fi
    else
        # If it's not a number, the original ps1 logic ran it
        should_run=true
    fi

    if [ "$should_run" = true ]; then
        found=1
        echo "--- Processing: $name ---"
        python autofigure2.py \
            --method_file "$filepath" \
            --output_dir "outputs/$name"
    fi
done

if [ "$found" -eq 0 ]; then
    echo "No files found."
else
    echo "Success!"
fi
