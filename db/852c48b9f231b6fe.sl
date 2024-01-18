{- SinOsc ; https://scsynth.org/t/6264/9 (es) -}
let freq = [440, 880];
let k = 12000 * (SampleRate() / 44100) / (freq * freq.log);
let sinSig = SinOsc(freq, 0);
let cosSig = SinOsc(freq, pi / 2);
let sqSig = (sinSig * k).Tanh;
let sawSig = sqSig * (cosSig + 1);
sawSig * 0.1
