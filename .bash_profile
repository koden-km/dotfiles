# default OSX prompt
#PS1='\h:\W \u\$ '
# coloured custom prompt
# PS1="\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\] $WINDOW\$ "

for filename in ~/dotfiles/lib/*.bash; do
    source $filename
done
unset filename

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
