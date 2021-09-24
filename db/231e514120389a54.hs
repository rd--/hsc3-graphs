-- jh ; <https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157> ; doppler
splay (sinOsc ar (120 * mce (map (2 **) (take 100 [0, 0.002 ..]))) 0) 1 0.1 0 True
