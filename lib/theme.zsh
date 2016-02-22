# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LS_COLORS

#setopt no_beep
setopt multios
setopt cdablevarS

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

# Setup the prompt with pretty colors
setopt prompt_subst
