// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157 ; rd (edit) ; psuedo-doppler
Splay.ar(SinOsc.ar((2 ** Array.series(100, 0, 0.002)) * 120)) * 0.1
