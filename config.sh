# Repository URL
export REPO_URL_ZSHRC="https://github.com/jamesphilhower/zshrc.git"
export REPO_URL_SCRIPTING="https://github.com/jamesphilhower/scripting.git"

# File Directories
export TARGET_DIR_ZSHRC="~/zshrc-temp"
export TARGET_DIR_SCRIPTING="~/zshrc-temp/scripting"
export SOURCE_ZSHRC="$HOME/.zshrc"
export CLEAN_FILENAME=".zshrc_clean"

# Define patterns
export BASE_PATTERNS=("API_KEY" "SECRET" "PASSWORD" "api-key" "-Key" "-key")
export ADVANCED_PATTERNS=("[a-zA-Z0-9]{25,}" "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
export IP_PATTERNS=("([0-9]{1,3}[\.]){3}[0-9]{1,3}")