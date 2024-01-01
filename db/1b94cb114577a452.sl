var trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
var sf = SfAcquireMono('floating_1');
var rate = BufSampleRate(sf);
var ph0 = BufFrames(sf) * LfNoise0(0.2);
var ph = Sweep(trig, rate.Neg) + ph0;
BufRd(1, sf, ph, 1, 2)
