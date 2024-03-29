# favorite-slack-emojis
Set of my favorite slack emojis to use 🙂

### Saving gif from preview
Sometimes I edit gifs in macOS preview, but saving seems to break the looping behavior. To fix that I used `imagemagick` `convert` (`brew install imagemagick`)
```
❯ convert -loop 0 source.gif destination.gif
```

### Intensify
```sh
#!/bin/sh

fileToIntensify=$1
fileOutput=$2
tempFileName=intensifier-temp
jitter=4
jitterRange=$((($jitter*2)+1))

for i in {1..10}
do
  ecks=$(($RANDOM%$jitterRange-$jitter))
  why=$(($RANDOM%$jitterRange-$jitter))

  if [ $ecks -ge 0 ]; then ecks="+"$ecks; fi;
  if [ $why -ge 0 ]; then why="+"$why; fi;

  echo $ecks$why
  convert -page $ecks$why $fileToIntensify -background none -flatten $tempFileName.$i
done

convert -delay 3 -dispose Background +page $tempFileName.* -colors 128 -loop 0 $fileOutput

rm $tempFileName.*
```

Use as
```sh
./intensify.sh {input_file} {output_file}
```

## `:gopher_peek:`
<img src="./emojis/gopher_peek.png" alt=":gopher_peek:" width=64>

## `:sad_peek:`
<img src="./emojis/sad_peek.png" alt=":sad_peek:" width=64>

## `:blob_sad:`
<img src="./emojis/blob_sad.gif" alt=":blob_sad:" width=64>

## `:cowboy_peek:`
<img src="./emojis/cowboy_peek.png" alt=":cowboy_peek:" width=64>

## `:dogjam:`
<img src="./emojis/dogjam.gif" alt=":dogjam:" width=64>

## `:kermit_typing:`
<img src="./emojis/kermit_typing.gif" alt=":kermit_typing:" width=64>

## `:kermit_wut:`
<img src="./emojis/kermit_wut.png" alt=":kermit_wut:" width=64>

## `:kermit_yaaaaay:`
<img src="./emojis/kermit_yaaaaay.png" alt=":kermit_yaaaaay:" width=64>

## `:rage_cry:`
<img src="./emojis/rage_cry.png" alt=":rage_cry:" width=64>

## `:blob-wave-peek:`
<img src="./emojis/blob-wave-peek.gif" alt=":blob-wave-peek:" width=64>

## `:meow_wave_peek:`
<img src="./emojis/meow_wave_peek.png" alt=":meow_wave_peek:" width=64>

## `:finger_guns:`
<img src="./emojis/finger_guns.png" alt=":finger_guns:" width=64>

## `:finger_guns2:`
<img src="./emojis/finger_guns2.png" alt=":finger_guns2:" width=64>

## `:sad_finger_guns:`
<img src="./emojis/sad_finger_guns.png" alt=":sad_finger_guns:" width=64>

## `:sad_finger_guns2:`
<img src="./emojis/sad_finger_guns2.png" alt=":sad_finger_guns2:" width=64>

## `:meow_comfy_fingerguns:`
<img src="./emojis/meow_comfy_fingerguns.png" alt=":meow_comfy_fingerguns:" width=64>

## `:meow_comfy_peek:`
<img src="./emojis/meow_comfy_peek.png" alt=":meow_comfy_peek:" width=64>

## `:anticipation:`
<img src="./emojis/anticipation.png" alt=":anticipation:" width=64>

## `:hhhehehe:`
<img src="./emojis/hhhehehe.gif" alt=":hhhehehe:" width=64>

## `:yeet_party:`
<img src="./emojis/yeet_party.gif" alt=":yeet_party:" width=64>

## `:true:`
<img src="./emojis/true.png" alt=":true:" width=64>

## `:party_pizza:`
<img src="./emojis/party_pizza.gif" alt=":party_pizza:" width=64>

## `:pizza_wave:`
<img src="./emojis/pizza_wave.gif" alt=":pizza_wave:" width=64>

## `:party-merge:`
<img src="./emojis/party-merge.gif" alt=":party-merge:" width=64>

## `:blink:`
<img src="./emojis/blink.gif" alt=":blink:" width=64>

## `:doot-doot:`
<img src="./emojis/doot-doot.gif" alt=":doot-doot:" width=64>

## `:cowboy-eyes:`
<img src="./emojis/cowboy-eyes.png" alt=":cowboy-eyes:" width=64>

## `:cowboy-ghost:`
<img src="./emojis/cowboy-ghost.png" alt=":cowboy-ghost:" width=64>

## `:pizza_peek:`
<img src="./emojis/pizza_peek.png" alt=":pizza_peek:" width=64>

## `:peek_template:`
<img src="./emojis/peek_template.png" alt=":peek_template:" width=64>

## `:pizza_activated:`
<img src="./emojis/pizza_activated.gif" alt=":pizza_activated:" width=64>

## `:not_like:`
<img src="./emojis/not_like.png" alt=":not_like:" width=64>

## `:argo_intensifies:`
<img src="./emojis/argo_intensifies.gif" alt=":argo_intensifies:" width=64>

## `:gopher_coffee:`
<img src="./emojis/gopher_coffee.gif" alt=":gopher_coffee:" width=64>

## `:gopher_beer:`
<img src="./emojis/gopher_beer.gif" alt=":gopher_beer:" width=64>

## `:gopher_intensifies:`
<img src="./emojis/gopher_intensifies.gif" alt=":gopher_intensifies:" width=64>
