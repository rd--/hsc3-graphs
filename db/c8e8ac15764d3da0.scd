// Freezer ; event control
var voiceFunc = { | e |
    var buf = 10, incr = 1, incrOff = 0, incrRand = 0, rightRand = 0.1, phaseSync = 0, phaseRand = 1, numLp = 4;
    Freezer.ar(buf, e.x * 0.75, e.x * (0.75 + (e.y * 0.1)), e.y, [incr * (1 - e.z), incr * (1 - e.i)], incrOff, incrRand, rightRand + (e.y * 0.1), phaseSync, phaseRand, numLp) * e.z * e.w
};
Voicer.ar(0, 16, voiceFunc).sum
