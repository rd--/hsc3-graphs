;; Storm ; very slow fade-in
var amp = 0.2, ampLagTime = 102, cut = 165, hicut = 440;
var src = { Rlpf(Crackle(1.9 + 0.05.Rand), cut, 1) } !+ 6;
src = Hpf(LeakDc(Decay2(src, 0.01, 0.1), 0.995), hicut);
Pan2(Limiter(src, 0.9, 0.1), 0, Ln(0, amp, ampLagTime))
