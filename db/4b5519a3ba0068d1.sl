let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('Floating');
BufRd(1, sf, Sweep(trig, BufSampleRate(sf)), 1, 2)
