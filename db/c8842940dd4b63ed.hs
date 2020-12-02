-- tDuty ; abstraction
let bp n d act = let (e,t) = unzip d
                     mk z l = dser z n (mce l)
                     sq = tDuty AR (mk 'α' t) 0 act (mk 'β' e) 0
                 in latch sq sq
    bp' d = bp (genericLength d) d
    tm m = let f (e,t) = (e,t * m) in map f
    f1 = midiCPS (bp 35 (tm 0.125 [(60,1),(63,1),(67,2),(68,1),(62,1)]) RemoveSynth)
    f2 = midiCPS (bp' [(60,1),(63,0.5),(67,0.5),(68,1),(62,1)] DoNothing)
in sinOsc AR (mce2 f1 f2) 0 * 0.1
