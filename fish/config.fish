if status is-interactive
    alias r="ranger"
    alias v="nvim"
    alias lg="lazygit"
    alias venv="source ./venv/bin/activate.fish"
    alias night="brightnessctl set 1%;redshift -x;redshift -O 4800"
    alias uni="ranger /home/tobi/Documents/UniversitySync/current_semester"
    export GTK_THEME="Nordic-darker"
    pyenv init - | source
    export PATH="$HOME/.cargo/bin:$PATH"
end
