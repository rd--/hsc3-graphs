// MiOmi ; external FM
var freq = MouseX.kr(2, 1000, 0, 0.2);
var amp = MouseY.kr(0, 1, 0, 0.2);
var audio_in = SinOsc.ar(freq, 0) * amp;
MiOmi.ar(audio_in: audio_in, pit: 40, fm1: 0.5, fm2: 0.5, xfb: 0.1, cutoff: 0.9)
