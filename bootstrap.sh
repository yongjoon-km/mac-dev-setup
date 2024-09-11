#!/bin/zsh

# Define the source paths
NVIM_CONFIG_SOURCE="./nvim-config"
TMUX_CONFIG_SOURCE="./tmux-config/.tmux.conf"
BREWFILE_SOURCE="./Brewfile"

# Define the target paths
NVIM_CONFIG_TARGET="$HOME/.config/nvim"
TMUX_CONFIG_TARGET="$HOME/.tmux.conf"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed. Updating and upgrading Homebrew..."
    brew update -q
    brew upgrade -q
fi

# Create the nvim config directory if it doesn't exist
mkdir -p "$NVIM_CONFIG_TARGET"

# Copy the nvim configuration file
echo "Copying nvim configuration..."
cp -r "$NVIM_CONFIG_SOURCE"/* "$NVIM_CONFIG_TARGET/"

# Copy the tmux configuration file
echo "Copying tmux configuration..."
cp "$TMUX_CONFIG_SOURCE" "$TMUX_CONFIG_TARGET"

# Run brew bundle with the Brewfile
echo "Running brew bundle..."
brew bundle -q --file="$BREWFILE_SOURCE"

echo "Setup completed successfully!"
