let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('Floating');
let rate = BufSampleRate(sf);
let ph0 = BufFrames(sf) * LfNoise0(0.2);
let ph = Sweep(trig, rate.Neg) + ph0;
BufRd(1, sf, ph, 1, 2)
