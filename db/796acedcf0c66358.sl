let sf = SfAcquire('Floating', 1, [1]).first;
let ph = Phasor(0, SfRateScale(sf), 0, SfFrames(sf), 0);
BufRd(1, sf, ph, 1, 2)
