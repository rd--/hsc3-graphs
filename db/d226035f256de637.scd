// ObxdFilter ; mouse cutoff & resonance
var cutoff = MouseX.kr(110, 110 * 16, 'exponential', 0.2);
var resonance = MouseY.kr(0, 1.1, 'linear', 0.2);
ObxdFilter.ar(PinkNoise.ar() * 0.5, cutoff, resonance, 0.5, 0, 0)
