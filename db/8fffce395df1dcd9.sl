let numChannels = 1;
let sf = SfAcquireMono('Floating');
let pointer = LfSaw(1 / 15, 0).LinLin(-1, 1, 0, 1);
let freqScale = MouseX(0.5, 2, 0, 0.2);
let windowSize = 0.1;
Warp1(numChannels, sf, pointer, freqScale, windowSize, -1, 8, 0.1, 2) * 0.25
