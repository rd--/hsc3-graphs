-- envStep
let env = envStep [0.0,0.5,0.7,1.0,0.9,0.0] [0.5,0.1,0.2,1.0,1.5,3] Nothing Nothing
    envgen = envGen AR 1 1 0 1 RemoveSynth env
in sinOsc AR (envgen * 1000 + 440) 0 * (envgen + 1) * 0.1
