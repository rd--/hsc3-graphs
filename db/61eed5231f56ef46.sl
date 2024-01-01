var numChannels = 8;
var envDur = 15;
var trigger = Impulse(Line(7.5, 15, envDur), 0);
var dur = 0.1;
var carFreq = Line(200, 800, envDur);
var modFreq = 200;
var index = Line(-1, 1, envDur);
var pan = Line(-0.85, 0.85, envDur);
var envBufNum = -1;
var maxGrains = 512;
GrainFm(numChannels, trigger, dur, carFreq, modFreq, index, pan, envBufNum, maxGrains).Splay * 0.1
