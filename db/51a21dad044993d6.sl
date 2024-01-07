(* PlayBuf ; accelerating pitch *)
let sf = SfAcquireMono('floating_1');
let rate = XLine(0.1, 100, 60);
PlayBuf(1, sf, rate, 0, 0, 1, 0) * 0.25
