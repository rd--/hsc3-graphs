// f0 ; tw 0165
var s = Limiter.ar(LeakDC.ar(InFeedback.ar(#[1, 0], 1), 0.995), 1, 0.01);
var dt = LFTri.ar(1 / #[6, 8], 0) * 0.4 + 0.5;
CombC.ar(BLowPass.ar(s, 2000) + Impulse.ar(0, 0), 1, dt, 1) * 0.99

//-----
CombC.ar(BLowPass.ar(Limiter.ar(LeakDC.ar(InFeedback.ar(#[1, 0]))), 2000) + Impulse.ar(0), 1, LFTri.ar(1 / #[6, 8]) * 0.4 + 0.5) * 0.99
