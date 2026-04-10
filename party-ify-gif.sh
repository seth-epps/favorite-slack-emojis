#!/bin/sh

fileToPartyIfy=$1
fileOutput=$2
smoothness=$3
fuzz=${4:-0}

frame_count=$(identify -format "%n\n" "$fileToPartyIfy" | head -1)
last_frame=$((frame_count - 1))

# Calculate step size based on smoothness
if [ "$smoothness" -eq 1 ]; then
  step=25
elif [ "$smoothness" -eq 5 ]; then
  step=2
else
  # Linear interpolation for step size: step = -5.75 * smoothness + 30.75
  step=$(awk -v s="$smoothness" 'BEGIN { print int(-5.75 * s + 30.75 + 0.5) }')
fi

# Calculate delay based on smoothness (inversely: smoothness 1 -> 10, smoothness 5 -> 2)
# Linear interpolation: delay = -2 * smoothness + 12
delay=$(awk -v s="$smoothness" 'BEGIN { print int(-2 * s + 12 + 0.5) }')

# Build the full hue cycle
# Start at 100 (no change), descend to 0, then ascend back toward 100
hue_values=(100)
for i in $(seq $((100 - step)) -"$step" 0); do
  hue_values+=("$i")
done
for i in $(seq "$step" "$step" $((100 - step))); do
  hue_values+=("$i")
done

total_hue_steps=${#hue_values[@]}

# Calculate the total output frames: we need enough frames to cover
# at least one full hue cycle AND complete full passes of the original
# animation (so it doesn't get cut off mid-cycle).
copies=$(( (total_hue_steps + frame_count - 1) / frame_count ))
total_frames=$((copies * frame_count))

# Build arguments array
# For each output frame, clone the corresponding original frame (cycling)
# and apply the hue for that position (also cycling through hue values).
# This means the original animation plays through fully while the hue
# shifts progressively per frame.
args=()
for idx in $(seq 0 $((total_frames - 1))); do
  frame=$((idx % frame_count))
  hue=${hue_values[$((idx % total_hue_steps))]}
  args+=(\( -clone "${frame}" -modulate 100,100,"${hue}" \))
done

# Run magick:
# 1. Load and coalesce the input GIF (frames 0 to last_frame)
# 2. For each output frame, clone the cycling original frame and modulate its hue
# 3. Delete the original frames (0 to last_frame), keeping only the modulated copies
magick "$fileToPartyIfy" -coalesce \
  "${args[@]}" \
  -delete 0-${last_frame} \
  -delay "$delay" \
  -loop 0 \
  -dispose Background \
  -colorspace sRGB \
  -fuzz $fuzz% \
  -layers Optimize \
  "$fileOutput"
