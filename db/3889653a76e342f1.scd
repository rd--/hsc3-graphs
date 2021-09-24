// interesting rising sounds ; https://github.com/cianoc/supercollider_fragments
{var f = {arg c; Pan2.ar(SinOsc.ar(LFSaw.ar((c * 0.2 + 1)/3, mul: 500, add: 700)), LFNoise0.kr(1))}
;var k = 5
;Mix.ar(Array.fill(k, f)) * 0.1}
