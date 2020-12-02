-- demandEnvGen ; read envelope break-points from buffer, here simply duration/level pairs.
--              ; the behavior is odd if the curve is zero (ie. flat segments).
let b = asLocalBuf 'α' [61,1,60,2,72,1,55,5,67,9,67]
    lvl = dbufrd 'β' b (dseries 'γ' 6 0 2) Loop
    dur = dbufrd 'δ' b (dseries 'ε' 5 1 2) Loop
    e = demandEnvGen KR lvl dur 1 0 1 1 1 0 1 RemoveSynth
in sinOsc AR (midiCPS e) 0 * 0.1
