#!/bin/bash
set -e

# Check if both msg_path and msg_dir are set
if [[ -n "$msg_path" && -n "$msg_dir" ]]; then
    echo "Error: Both 'msg_path' and 'msg_dir' are set. Please provide only one."
    exit 1
fi

# Ensure either msg_path or msg_dir is set
if [[ -z "$msg_path" && -z "$msg_dir" ]]; then
    echo "Error: No input specified. Please set either 'msg_path' for a single file or 'msg_dir' for a directory."
    exit 1
fi

# Ensure output directory exists
output_dir="./converted-messages"
mkdir -p "$output_dir"

if [[ -n "$msg_path" ]]; then
    # Process single file
    if [[ ! -f "$msg_path" ]]; then
        echo "Error: Specified file '$msg_path' does not exist."
        exit 1
    fi

    echo "Processing single file: $msg_path"
    msg_name=$(basename "$msg_path" .msg)

    # Convert the .msg file
    python3 -m extract_msg "$msg_path" --out "$output_dir" --prepared-html --use-filename --html || {
        echo "Error: Failed to convert $msg_path"
        exit 1
    }

    echo "Converted: $msg_path to $output_dir/$msg_name/message.html"

elif [[ -n "$msg_dir" ]]; then
    # Process all files in the directory
    if [[ ! -d "$msg_dir" ]]; then
        echo "Error: Specified directory '$msg_dir' does not exist."
        exit 1
    fi

    echo "Processing all files in directory: $msg_dir"
    for msg_file in "$msg_dir"/*.msg; do
        if [[ -f "$msg_file" ]]; then
            echo "Processing: $msg_file"
            msg_name=$(basename "$msg_file" .msg)

            # Convert the .msg file
            python3 -m extract_msg "$msg_file" --out "$output_dir" --prepared-html --use-filename --html || {
                echo "Error: Failed to convert $msg_file"
                continue
            }

            echo "Converted: $msg_file to $output_dir/$msg_name/message.html"
        else
            echo "No .msg files found in directory: $msg_dir"
            break
        fi
    done
fi

echo "MSG File Conversion Completed."
