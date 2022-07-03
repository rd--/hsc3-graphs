// ObxdFilter ; mouse cutoff
var cutoff = MouseX.kr(110, 110 * 16, 'exponential', 0.2);
ObxdFilter.ar(PinkNoise.ar() * 0.5, cutoff, 0, 0.5, 0, 0)
