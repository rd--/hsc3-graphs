(* SfRead ; phasor as phase input ; requires=SfAcquire *)
let sf = SfAcquireStereo('piano-c5');
let tr = Impulse(1 / SfDur(sf), 0);
let ph = Phasor(tr, SfRateScale(sf), 0, SfFrames(sf), 0);
SfRead(sf, ph, 0, 2)
