// Rumble
var amp = 0.2, lagTime = 120, freq = 240, frq = 490;
var src = LeakDC.ar(Decay2.ar(ClipNoise.ar() * 0.2, 0.01, 0.1), 0.995);
Pan2.ar(LeakDC.ar(LPF.ar(RLPF.ar(src, freq, 1), frq), 0.995), 0, Line.kr(0, amp, lagTime))
