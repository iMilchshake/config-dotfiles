killall -q polybar

# get the screens
outputs=$(polybar --list-monitors | cut -d":" -f1)
primary=$(polybar --list-monitors | grep "primary" | cut -d":" -f1)

# iterate over outputs and setup the bar on them
for m in $outputs; do
  export MONITOR=$m
  if [[ $m == $primary ]]; then
    polybar --reload main &
  else
    polybar --reload sec &
  fi

  # disown
done
