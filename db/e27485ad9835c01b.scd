// Sieve1
var sieve = [88] ++ { [0.1.rand, 0.5.rand].wchoose([0.8, 0.2]) }.dup(88);
var gap = MouseX.kr(90, [180, 270], 0, 0.2);
var stoch = Sieve1.ar(sieve.asLocalBuf, gap, 1);
var env = Decay2.ar(stoch.abs, 0.01, MouseY.kr(0.1, 1, 0, 0.2));
var freq = Decay2.ar(stoch, 0.01, MouseY.kr(0.5, 1, 0, 0.2)) * 110 + 440;
SinOsc.ar(freq, 0) * env * 0.1
