#!/bin/bash

source "$TARGET_DIR_ZSHRC/config.sh"

# Function to build grep pattern and filter lines
filter_lines() {
    local filename=$1
    local temp_file=$2
    local omitted_file=$3

    # Combine all patterns
    local all_patterns=("${BASE_PATTERNS[@]}" "${ADVANCED_PATTERNS[@]}" "${IP_PATTERNS[@]}")

    # Create the final grep pattern
    local grep_pattern=$(IFS="|"; echo "${all_patterns[*]}")

    # Perform the filtering
    grep -E "$grep_pattern" "$filename" > "$omitted_file"
    grep -vE "$grep_pattern" "$filename" > "$temp_file"
}

# Create a cleanup function
cleanup() {
    rm -rf "$TEMP_DIR"
    rm "$TEMP_FILE"
}

# Register the cleanup function to run on script exit
trap cleanup EXIT

# Temporary file to hold sanitized .zshrc content
TEMP_FILE=$(mktemp)
OMITTED_LINES=$(mktemp)

# Clone the repository to a temporary directory
TEMP_DIR=$(mktemp -d)
git clone "$REPO_URL_ZSHRC" "$TEMP_DIR"
cd "$TEMP_DIR" || exit 1

# Use the function to filter lines
filter_lines "$SOURCE_ZSHRC" "$TEMP_FILE" "$OMITTED_LINES"

# Show the omitted lines and ask for user confirmation
echo -e "\033[0;31mThe following lines will be omitted:\033[0m"
while IFS= read -r line; do
    echo -e "\033[0;31m$line\033[0m"
done < "$OMITTED_LINES"
read -p "Do you want to proceed? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

# Copy the sanitized .zshrc to the temporary repository directory
cp "$TEMP_FILE" "$CLEAN_FILENAME"

# Commit and push changes
git add "$CLEAN_FILENAME"
git commit -m "Sync .zshrc"
git push origin main

echo "Sync complete."
