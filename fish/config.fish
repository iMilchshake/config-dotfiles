if status is-interactive
    alias r="ranger"
    alias v="nvim"
    alias lg="lazygit"
    export GTK_THEME="Nordic-darker"
    pyenv init - | source
    export PATH="$HOME/.cargo/bin:$PATH"
end