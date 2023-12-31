(* SfRead ; phasor as phase input ; requires=SfAcquire *)
var sf = SfAcquireStereo('piano-c5');
var tr = Impulse(1 / SfDur(sf), 0);
var ph = Phasor(tr, SfRateScale(sf), 0, SfFrames(sf), 0);
SfRead(sf, ph, 0, 2)
