// noise burst sweep (jmcc) #6 ; mouse control
var n = WhiteNoise.ar().dup;
var lfoRate = MouseX.kr(10, 60, 1, 0.2);
var amp = LFSaw.kr(lfoRate, -1).max(0);
var cfreq = MouseY.kr(400, 8000, 1, 0.2);
var freq = SinOsc.kr(0.2, 0) * cfreq + (1.05 * cfreq);
Resonz.ar(n * amp, freq, 0.1)
