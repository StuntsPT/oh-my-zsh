PROMPT=$'%{$fg_bold[green]%}%n%{$fg_bold[red]%}@%{$fg_bold[green]%}%m %{$fg[blue]%}%D{[%I:%M:%S]} %{$reset_color%}%{$fg_bold[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} $%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
