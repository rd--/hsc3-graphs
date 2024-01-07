let s = LfNoise0(2);
let c = Changed(s, 0);
let d = Decay2(c, 0.01, 0.5);
SinOsc(440 + ([s, d] * 440), 0) * 0.1
