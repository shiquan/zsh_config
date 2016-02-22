# add a function path
fpath=($ZSH/functions $fpath)

# add config files
for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done

# Add all defined plugins to fpath. This must be done
# before running compinit.
for plugin ($plugins); do
  if is_plugin $ZSH_CUSTOM $plugin; then
    fpath=($ZSH_CUSTOM/plugins/$plugin $fpath)
  elif is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  fi
done

#while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &

# Load and run compinit
autoload -U compinit
compinit -i

# Load the theme
if [ "$ZSH_THEME" = "random" ]
then
  themes=($ZSH/themes/*zsh-theme)
  N=${#themes[@]}
  ((N=(RANDOM%N)+1))
  RANDOM_THEME=${themes[$N]}
  source "$RANDOM_THEME"
else
  if [ ! "$ZSH_THEME" = ""  ]
  then
      source "$ZSH/themes/$ZSH_THEME.zsh-theme"
  fi
fi
