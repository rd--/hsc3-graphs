-- varLag ; the varLag UGen is not working ; there is varLag_env instead
let sqr = linLin (lfPulse kr 1 0 0.5) 0 1 100 400
    crv = varLag_env sqr 0.2 (EnvNum (line kr (-8) 8 15 RemoveSynth)) Nothing
in sinOsc ar crv 0 * 0.3
