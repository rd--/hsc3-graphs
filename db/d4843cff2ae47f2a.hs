-- tDuty ; abstraction
let bp n d act = let (e,t) = unzip d
                     mkId z l = dserId z n (mce l)
                     sq = tDuty ar (mkId 'α' t) 0 act (mkId 'β' e) 0
                 in latch sq sq
    bp' d = bp (genericLength d) d
    tm m = let f (e,t) = (e,t * m) in map f
    f1 = midiCPS (bp 35 (tm 0.125 [(60,1),(63,1),(67,2),(68,1),(62,1)]) RemoveSynth)
    f2 = midiCPS (bp' [(60,1),(63,0.5),(67,0.5),(68,1),(62,1)] DoNothing)
in sinOsc ar (mce2 f1 f2) 0 * 0.1
