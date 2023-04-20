# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[magenta]%}╭─%{$fg[yellow]%}%n %{$fg[red]%}in %{$fg[blue]%}(%{$fg[magenta]%}%~%{$fg[blue]%})
%{$fg[magenta]%}╰────%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases, functions and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/functions.zsh"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

fpath+=$XDG_CONFIG_HOME/.zcomp
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# vi mode
bindkey -v
export KEYTIMEOUT=1
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

bindkey -s '^o' 'lfcd\n'
bindkey -s '^w' 'open_with_mpv\n'
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^g' 'cd "$(fd -H | fzf)"\n'
bindkey -s '^n' 'nvim "$(fzf)"\n'
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval $(starship init zsh)

# Load syntax highlighting; should be last.
source /home/siki/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
