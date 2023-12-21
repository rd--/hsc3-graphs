(* SinOsc ; https://scsynth.org/t/6264/9 (es) *)
var freq = [440, 880];
var k = 12000 * (SampleRate() / 44100) / (freq * freq.log);
var sinSig = SinOsc(freq, 0);
var cosSig = SinOsc(freq, pi / 2);
var sqSig = (sinSig * k).Tanh;
var sawSig = sqSig * (cosSig + 1);
sawSig * 0.1
