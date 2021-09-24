-- jh ; <https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157>
mix (sinOsc ar (300 * mce (map (4 **) (take 200 [0, 0.002 ..]))) 0 * 0.02)
