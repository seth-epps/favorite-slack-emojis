#!/bin/sh

fileToPartyIfy=$1
fileOutput=$2
smoothness=$3

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

# Build arguments array
args=()
# Generate descending sequence starting after 100 to avoid
# duplicate start frames.
#
# We descend from 100 because 100 == no change and the first frame
# is aways the initial input
for i in $(seq $((100 - step)) -"$step" 0); do
  args+=(\( "$fileToPartyIfy" -modulate 100,100,"$i" \))
done
# Generate ascending sequence starting at `step` to avoid
# duplicate frames when returning to start.
#
# Like above, we stop at the frame before 100 to avoid
# two initial frames
for i in $(seq "$step" "$step" $((100 - step))); do
  args+=(\( "$fileToPartyIfy" -modulate 100,100,"$i" \))
done

# Run magick with the array expanded properly
magick "$fileToPartyIfy" -delay "$delay" -loop 0 -dispose Background \
  "${args[@]}" \
  -colorspace sRGB "$fileOutput"
