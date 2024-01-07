(* PlayBuf ; sine wave control of playback rate ; negative rate plays backwards *)
let sf = SfAcquireMono('floating_1');
let rate = SinOsc(XLine(0.2, 8, 30), 0) * 2 + 0.1;
PlayBuf(1, sf, rate, 0, 0, 1, 0) * 0.25
