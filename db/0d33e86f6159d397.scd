// angry birds ; https://github.com/cianoc/supercollider_fragments
{var lfo = LFNoise1.ar(freq: [28, 27], mul: 400, add: 2000)
;SinOsc.ar(freq: lfo, mul: 0.1)}
