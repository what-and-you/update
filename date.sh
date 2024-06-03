clear
text="Your Text Here"

# Empty line for spacing
empty_line=" "

# Get terminal width
tput cols

# Function to scroll text
scroll_text() {
  local full_text="$empty_line$text$empty_line"
  local length=${#full_text}
  local i

  for ((i=0; i<$length; i++)); do
    echo -ne "${full_text:i:cols}${\x1B[${length - i}G}"
    sleep 0.1
  done

  for ((i=$length; i>=0; i--)); do
    echo -ne "${full_text:i:cols}${\x1B[${length - i}G}"  # Move cursor back
    sleep 0.1  # Adjust speed as needed
  done
}

# Infinite loop for continuous scrolling
while true; do
  scroll_text
done
