// ObxdFilter ; multimode selects the filter mode, the range is (0,1), there are four modes
var cutoff = MouseX.kr(110, 110 * 16, 'exponential', 0.2);
var multimode = MouseY.kr(0, 1, 'linear', 0.2);
ObxdFilter.ar(PinkNoise.ar() * 0.5, cutoff, 0, multimode, 0, 1)
