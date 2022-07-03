// Freezer
var buf = 10, left = 0, right = 1, gain = 1, incr = 1, incrOff = 0, incrRand = 0, rightRand = 0, phaseSync = 0, phaseRand = 0, numLp = 4;
Freezer.ar(buf, left, right, gain, [incr, incr + 0.01], incrOff, incrRand, rightRand, phaseSync, phaseRand, numLp) * 0.1
