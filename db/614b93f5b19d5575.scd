// jh ; https://scsynth.org/t/auditory-illusion-with-exponentially-spaced-frequencies/4157/3
{SinOsc.ar(200.iota.lincurve(0, 199, 300, 300 * (4 ** (199 * 0.002)), -2)).sum * 0.02}
