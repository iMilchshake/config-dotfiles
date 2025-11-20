set -g notes_root "$HOME/data/docs/notes"

function notes
    set dir (fd -t d -d 1 . "$notes_root" 2>/dev/null \
        | sort \
        | fzf --height=40% --reverse --prompt="notes> " --exit-0)

    test -z "$dir"; and return
    cd "$dir"; exec nvim
end
