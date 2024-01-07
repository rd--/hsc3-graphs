let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('floating_1');
let rate = Sweep(trig, 2) + 0.5;
BufRd(1, sf, Sweep(trig, BufSampleRate(sf) * rate), 1, 2)
