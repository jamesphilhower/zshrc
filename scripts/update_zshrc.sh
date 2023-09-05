#!/bin/bash

source "$TARGET_DIR_ZSHRC/config.sh"

# Cleanup function to remove temporary directory
cleanup() {
    rm -rf "$TEMP_DIR"
}

# Register the cleanup function to run when the script exits
trap cleanup EXIT

# Variables
TEMP_DIR=$(mktemp -d)
LOCAL_ZSHRC="$SOURCE_ZSHRC"
REMOTE_ZSHRC="$TEMP_DIR/$CLEAN_FILENAME"

# Clone the repo into a temp directory
git clone "$REPO_URL_ZSHRC" "$TEMP_DIR"

# Check if clone was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone repository."
    exit 1
fi

# Compare the remote and local .zshrc and append new lines to local .zshrc
#The -23 option suppresses the output from columns 2 and 3.
#The -2 option suppresses lines unique to the second file.
#The -3 option suppresses lines that appear in both files.
# Read lines from the repository .zshrc_clean and append them to the target .zshrc if they don't exist
comm -23 <(sort "$REMOTE_ZSHRC") <(sort "$LOCAL_ZSHRC") >> "$LOCAL_ZSHRC"

echo "Update complete."
