{- alarm -}
let tone = SinOsc([600, 800], 0);
let control = Lpf(LfPulse(2, 0, 0.5), 70);
SelectX(control, tone) * 0.1
