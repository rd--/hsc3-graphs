// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157
SinOsc.ar((4 ** ((0 .. 199) * 0.002)) * 300).sum * 0.02
