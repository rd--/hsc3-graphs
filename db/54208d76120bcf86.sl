;; Rumble ; very slow fade-in
var amp = 0.2, lagTime = 120, freq = 240, frq = 490;
var src = LeakDc(Decay2(ClipNoise() * 0.2, 0.01, 0.1), 0.995);
Pan2(LeakDc(Lpf(Rlpf(src, freq, 1), frq), 0.995), 0, Ln(0, amp, lagTime))
