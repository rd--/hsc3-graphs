// UGen.linlin (note Clip UGen)
{SinOsc.ar(freq: Sweep.kr(trig: 0, rate: 1).linlin(inMin: 0, inMax: 1, outMin: 110, outMax: 220, clip: 'minmax'), phase: 0)}
