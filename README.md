# Zsh Configuration Repository

## Overview

This repository contains configurations and scripts to set up a Zsh environment. It includes the following:

- `.zshrc` configurations
- Utility functions for Python (`mypy`) and Node.js (`mynode`)
- A `sync_zshrc` script to sync `.zshrc` to this GitHub repository, excluding sensitive keys (aliased to synczsh)
- A `update_zshrc` script to get changes to `.zshrc` from remote to local (aliased to updatezsh)
- A config.sh for customizing installation variables

## Installation

To set up your Zsh environment on a new machine, follow these steps:

### 1. Clone the Repository

First, clone this repository to your machine. You can clone it wherever you like, but for these instructions, we'll assume you're cloning it to your home directory.

```bash
git clone https://github.com/jamesphilhower/zshrc.git ~/zshrc-temp
```

### 2. Run the Setup Script

You can set up your environment using one of the following methods:

#### Method 1: Cloning the Repository

Clone the repository and then run the setup script.

```bash
git clone https://github.com/jamesphilhower/zshrc.git ~/zshrc-temp
cd ~/zshrc-temp
chmod +x setup.sh
./setup.sh
```

#### Method 2: Using `wget` to Download the Script

```bash
wget https://raw.githubusercontent.com/jamesphilhower/zshrc/main/setup.sh
cd ~/zshrc-temp
chmod +x setup.sh
./setup.sh
```

#### Method 3: Using `curl` to Download the Script

```bash
curl -O https://raw.githubusercontent.com/jamesphilhower/zshrc/main/setup.sh
cd ~/zshrc-temp
chmod +x setup.sh
./setup.sh
```

#### Difference between `wget` and `curl`

- `wget` is designed for downloading files. It can download an entire website or parts of a website and can work in the background.
  
- `curl` is more flexible and is designed to transfer data to or from a server. It supports a wide range of protocols and is often used for API calls.

Choose the method that best suits your needs to set up your Zsh environment.

---

Feel free to include this revised section in your README for comprehensive setup instructions.
### 3. Source Your `.zshrc`

Either restart your shell or run the following command to apply the new configurations:

```bash
source ~/.zshrc
```

## Usage

### Utility Functions

- `mypy [SCRIPT_NAME ] [ARG1] [ARG2] ...`: Run a Python script located at `/path/to/scripting.repo/`.
  
  Example:
  ```bash
  mypy hello_world arg1 arg2
  ```

- `mynode [SCRIPT_NAME] [ARG1] [ARG2] ...`: Run a Node.js script located at `/path/to/scripting.repo/`.

  Example:
  ```bash
  mynode hello_world arg1 arg2
  ```

### Syncing `.zshrc`

To sync your `.zshrc` with this repository, use the `synczsh` command. This will filter out any sensitive keys before uploading.

```bash
synczsh
```

## Contributions

Feel free to submit pull requests or open issues if you find any problems or have suggestions for improvements.
