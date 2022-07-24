// Pulse ; https://nathan.ho.name/posts/integer-ring-modulation/
var freq = 100;
Pulse.ar(freq, 0.5) * Pulse.ar(freq * LFTri.ar(0.3, pi).linlin(-1, 1, 1, 20).round, 0.5) * 0.1;
