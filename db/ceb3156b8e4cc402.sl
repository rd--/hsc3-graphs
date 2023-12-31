(* PlayBuf ; modulate the frequency of a SinOsc with a sample (adc) *)
var soundFile = SfAcquireMono('floating_1');
var sampleLoop = PlayBuf(1, soundFile, 0.5, 0, 0, 1, 0);
SinOsc([100, 150] + (sampleLoop * MouseX(0, 1400, 0, 0.1)), 0) * MouseY(0.2, 0.0002, 0, 0.2)
