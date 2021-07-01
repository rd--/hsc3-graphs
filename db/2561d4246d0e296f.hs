-- sinOsc ; 12 khz - 15.5 khz sweep
pan2 (sinOsc ar (range_hs (12000,15500) (sinOsc kr (1/6) 0)) 0) 0 0.75
