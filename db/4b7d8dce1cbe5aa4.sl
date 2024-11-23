/* Rumble ; very slow fade-in */
let amp = 0.2; let lagTime = 120; let freq = 240; let frq = 490;
let src = LeakDc(Decay2(ClipNoise() * 0.2, 0.01, 0.1), 0.995);
Pan2(LeakDc(Lpf(Rlpf(src, freq, 1), frq), 0.995), 0, Line(0, amp, lagTime))
