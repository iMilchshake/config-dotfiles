if status is-interactive
    alias r="ranger"
    alias v="nvim"
    alias lg="lazygit"
    alias venv="source ./venv/bin/activate.fish"
    alias night="brightnessctl set 1%;redshift -x;redshift -O 4800"
    alias uni="ranger /home/tobi/docs/UniversitySync/current_semester"
    alias windoof="sudo grub-reboot 2 && reboot"
    alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
    pyenv init - | source
    export PATH="$HOME/.cargo/bin:$PATH"
    alias qs="ranger /home/tobi/data/quickshare"
    alias bm="~/scripts/bashmount"
end

# quit ranger when already inside a shell instead of opening a nested instance
function ranger
    if [ -z "$RANGER_LEVEL" ]
        /usr/bin/ranger $argv
    else
        exit
    end
end
