#!/bin/bash
source ./config.sh

# Define a cleanup function
cleanup() {
  cd "$ORIGINAL_DIR" # Go back to the original directory
}

# Save the original directory
ORIGINAL_DIR=$(pwd)

# Register the cleanup function to run when the script exits
trap cleanup EXIT

clone_repo() {
  repo_url=$1
  target_dir=$2
  
  # Remove quotes from around the tilde
  eval target_dir=$target_dir

  if [ -d "$target_dir" ]; then
    echo "Error: Directory $target_dir already exists. Aborting."
    exit 1
  fi
  
  git clone "$repo_url" "$target_dir"
}

# Clone the zshrc git repo
clone_repo "$REPO_URL_ZSHRC" "$TARGET_DIR_ZSHRC"

cd "$TARGET_DIR_ZSHRC" || exit 1  # Exit if the directory doesn't exist

# Make your scripts executable
chmod +x scripts/*

# Append alias for the sync script
echo "alias synczsh='$TARGET_DIR_ZSHRC/scripts/sync_zshrc.sh'" >> "$SOURCE_ZSHRC"
echo "alias updatezsh='$TARGET_DIR_ZSHRC/scripts/update_zshrc.sh'" >> "$SOURCE_ZSHRC"

# Clone the scripting git repo relative to zshrc-temp
clone_repo "$REPO_URL_SCRIPTING" "$TARGET_DIR_SCRIPTING"

# Update utility functions with the new relative path
echo "mypy() {" >> "$SOURCE_ZSHRC"
echo "    python $TARGET_DIR_SCRIPTING/\$1.py \"\${@:2}\"" >> "$SOURCE_ZSHRC"
echo "}" >> "$SOURCE_ZSHRC"

echo "mynode() {" >> "$SOURCE_ZSHRC"
echo "    node $TARGET_DIR_SCRIPTING/\$1.js \"\${@:2}\"" >> "$SOURCE_ZSHRC"
echo "}" >> "$SOURCE_ZSHRC"