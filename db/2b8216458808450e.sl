(* PlayBuf ; requires=SfAcquire *)
var sf = SfAcquireStereo('piano-c5');
PlayBuf(1, sf, SfRateScale(sf), 1, 0, 1, 0) * 0.5
