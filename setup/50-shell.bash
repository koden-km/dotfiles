set -e

echo "Configuring shell..."

# Note: brew bin location changes based on OS/platform
# - Intel:         /usr/local/bin/zsh
# - Apple Silicon: /opt/homebrew/bin/zsh

if [[ "/opt/homebrew/bin/zsh" == "$SHELL" ]]; then
    echo "Brew zsh is already the current shell."
else
    if grep -Fxq /opt/homebrew/bin/zsh /etc/shells; then
        echo "Brew zsh is already a standard shell."
    else
        echo "Adding brew zsh as a standard shell..."
        sudo sh -c 'echo /opt/homebrew/bin/zsh >> /etc/shells'
    fi

    echo "Setting brew zsh as the current shell..."
    chsh -s /opt/homebrew/bin/zsh
fi

echo "Installing fonts ..."
cp $HOME/dotfiles/files/*.* $HOME/Library/Fonts/

if [[ -e "$HOME/.zprezto" ]]; then
    echo "Prezto already installed."
else
    echo "Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
fi
