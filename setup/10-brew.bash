set -e

echo "Installing packages..."

brew bundle --file="$DOTFILES_PATH/Brewfile"
