(* PlayBuf ; accelerating pitch *)
var sf = SfAcquireMono('floating_1');
var rate = XLine(0.1, 100, 60);
PlayBuf(1, sf, rate, 0, 0, 1, 0) * 0.25
