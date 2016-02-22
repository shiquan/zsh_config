#for Emacs在Emacs终端中使用Zsh的一些设置 不推荐在Emacs中使用它
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
fi
