// SinOsc ; https://scsynth.org/t/6264/9 (es)
var freq = [440, 880];
var k = 12000 * (SampleRate.ir()  / 44100) / (freq * freq.log10);
var sinSig = SinOsc.ar(freq, 0);
var cosSig = SinOsc.ar(freq, pi / 2);
var sqSig = (sinSig * k).tanh;
var sawSig = sqSig * (cosSig + 1) * 0.5;
sawSig
