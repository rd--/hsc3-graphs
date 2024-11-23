/* 20060917 ; rd ; requires=DustRange */
let b0 = [60 71 89 65 36 57 92 97 92 97].asLocalBuf;
let b1 = [71 89 60 57 65 36 95 92 93 97].asLocalBuf;
let clk = DustRange(0.2, 0.9);
let env = Decay2(clk, 0.02, 2.5);
let idx = Stepper(clk, 0, 0, 15, 1, 0);
let f1 = (BufRd(1, [b0, b1], idx, 1, 1) - 24).MidiCps;
let f2 = LfNoise0([1, 3]) * 1.2 + f1;
let o1 = SinOsc(f1, 0) * env;
let o2 = SinOsc(f2, 0) * env;
o1 + o2 * 0.2
