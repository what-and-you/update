#!/bin/bash

# Text to be displayed
text="Hello, World!"

# Variables for text position and direction
position=0
direction=1

while true; do
    # Clear the line
    tput cuu1 tput el

    # Move the cursor to the desired position
    tput cup $position 0

    # Display the text
    echo "$text"

    # Update the position based on the direction
    if [ $direction -eq 1 ]; then
        ((position++))
    else
        ((position--))
    fi

    # Check if the text is off the screen
    if [ $position -lt 0 ] || [ $position -ge ${#text} ]; then
        # Reverse the direction
        ((direction *= -1))
    fi

    # Sleep for a short interval to control the speed
    sleep 0.1

done
