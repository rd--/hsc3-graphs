{- PlayBuf ; modulate frequency and amplitude of a SinOsc with a sample (adc) -}
let soundFile = SfAcquireMono('floating_1');
let sampleLoop = PlayBuf(1, soundFile, 0.5, 0, 0, 1, 0);
let ampMod = (sampleLoop * MouseY(0, 1, 0, 0.2)) + MouseY(1, 0, 0, 0.2);
SinOsc([100 150] + (sampleLoop * MouseX(0, 1400, 0, 0.1)), 0) * ampMod * 0.2
