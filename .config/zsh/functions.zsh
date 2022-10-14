# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

chst () {
    [ -z $1 ] && echo "no args provided!" || (curl -s cheat.sh/$1 | bat --style=plain)
}

# Install packages (change to pacman/AUR helper of your choice)
in() {
    paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S --skipreview
}

# Remove installed packages (change to pacman/AUR helper of your choice)
re() {
    paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

# Edit configs
conf() {
  file=$(fd . "$HOME/.config/" -t f|fzf) 
  [ -z "$file" ] || $EDITOR $file
}

# Open files with mpv
open_with_mpv() {
  file=$(fd . "$HOME/Videos/" -t f|fzf) 
  [ -z "$file" ] || mpv $file
}

# animdl stuff
adn () {
	ep=${2:-1-}
	name="$(echo $1 | sed 's/-/ /g')"
	animdl download -q best "animixplay:$name" -r "$ep"
}
anime () {
	ep=${2:-1-}
	name="$(echo $1 | sed 's/-/ /g')"
	animdl stream -q best "animixplay:$name" -r "$ep"
}

gg () {
  git clone "https://github.com/$1"
}

share () {
    curl -s https://0x0.st -F "file=@$*" | xclip -sel clip && notify-send "Link copied to clipboard"
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
