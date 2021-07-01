-- pulsing bottles (jmcc) #2 ; texture=overlap,4,4,4,maxBound
let r _ = resonz (whiteNoise ar * lfPulse kr (rand 4 14) 0 0.25 * rand 0 0.7) (rand 400 7400) 0.01
    s _ = sinOsc kr (rand 0.1 0.5) (rand 0 (pi * 2))
  in mixFill 6 (\n -> pan2 (r n) (s n) 1)
