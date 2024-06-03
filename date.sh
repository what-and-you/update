clear

# Text to scroll
text="Hello, World! This is an animated text scrolling script."

# Convert text to an array
text_array=(${text// /})

# Number of elements in the array
array_length=${#text_array[@]}

# Starting position
position=0

while true; do
    # Clear the line
    tput cuu1
    tput el

    # Print the text from the current position to the end of the array
    for ((i = $position; i < $array_length; i++)); do
        echo "${text_array[$i]}"
    done

    # Print the text from the beginning of the array to the current position
    for ((i = 0; i < $position; i++)); do
        echo "${text_array[$i]}"
    done

    # Increment the position
    position=$((($position + 1) % $array_length))

    # Sleep for a short time to create the scrolling effect
    sleep 0.1

done
