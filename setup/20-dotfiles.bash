set -e

echo "Installing dotfiles..."

for FILE in "$HOME/dotfiles/files/".* "$HOME/dotfiles/files/"*; do
    NAME=$(basename $FILE)

    if [[ "." == $NAME || ".." == $NAME ]]; then
        continue
    fi

    if [ -e "$HOME/$NAME" ]; then
        echo "Skipping $NAME because it already exists"
    else
        echo "Linking $NAME"
        ln -s $FILE "$HOME/$NAME"
    fi
done
