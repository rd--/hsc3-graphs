{- LfPulse ; humm -}
let freqBass = 50;
let freq = 50;
let pan = 0;
let amp = 0.1;
let snd = LfPulse(freq, 0, 0.5);
20.timesRepeat {
	snd := MidEq(snd, ExpRand(300, 12000), 0.1, -20)
};
snd := Hpf(snd * 3, MouseX(5000, 7000, 1, 0.2));
snd := Lpf(snd, MouseY(9000, 11000, 1, 0.2));
snd := snd + SinOsc(freqBass, 0);
EqPan2(snd, pan) * amp
