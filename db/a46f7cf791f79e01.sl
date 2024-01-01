var numChannels = 1;
var sf = SfAcquireMono('floating_1');
var pointer = LfSaw(1 / 15, 0).Range(0, 1);
var freqScale = MouseX(0.5, 2, 0, 0.2);
var windowSize = 0.1;
Warp1(numChannels, sf, pointer, freqScale, windowSize, -1, 8, 0.1, 2) * 0.25
