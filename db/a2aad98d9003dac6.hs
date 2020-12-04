-- envStep ; major scale, accelerating, with loop & release nodes
let env = envStep [0,2,4,5,7,9,11,12,0] (take 9 (iterate (* 0.75) 1)) (Just 8) (Just 0)
    envgen = envGen AR 1 1 0 1 DoNothing env
in sinOsc AR (midiCPS (envgen + 60)) 0 * 0.1
