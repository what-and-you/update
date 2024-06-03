clear

# Text to animate
text="This is an animated text"

# Animation speed (adjust as desired)
animation_speed=5

# Get terminal dimensions
width=$(tput cols)
height=$(tput lines)

# Calculate starting position
position=0

while true; do
    # Clear the line where the text will be displayed
    tput cup 0 $(($height - 1))

    # Print the text with the current position
    echo -n "${text:position:width}"

    # Increment the position
    position=$((position + 1))

    # Wrap around if the end of the text is reached
    if [ $position -gt ${#text} ]; then
        position=0
    fi

    # Sleep for the animation speed
    sleep $animation_speed

    # Clear the entire screen if the text reaches the end of the line
    if [ $position -eq ${#text} ]; then
        tput clear
    fi
done
