if status is-interactive
    alias r="ranger"
    alias v="nvim"
    alias lg="lazygit"
    alias night="brightnessctl set 1%;redshift -x;redshift -O 4800"
    export GTK_THEME="Nordic-darker"
    pyenv init - | source
    export PATH="$HOME/.cargo/bin:$PATH"
end
