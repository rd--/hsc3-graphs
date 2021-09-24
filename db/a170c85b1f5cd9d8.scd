// saw as an lfo ; https://github.com/cianoc/supercollider_fragments
{var lfo = LFSaw.ar(freq: 2, mul: -100, add: 600)
;SinOsc.ar(lfo, mul: 0.1)}
