{- Storm ; very slow fade-in -}
let amp = 0.2; let ampLagTime = 102; let cut = 165; let hicut = 440;
let src = { Rlpf(Crackle(1.9 + 0.05.Rand0), cut, 1) } !+ 6;
src = Hpf(LeakDc(Decay2(src, 0.01, 0.1), 0.995), hicut);
Pan2(Limiter(src, 0.9, 0.1), 0, Line(0, amp, ampLagTime))
