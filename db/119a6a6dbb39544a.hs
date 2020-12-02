-- tDuty ; note that the 440 is the shorter pitch, since gap is set to false
let d0 = dser 'α' 12 (mce [0.1, 0.3])
    d1 = dser 'β' 12 (mce [440, 880])
    t = tDuty AR d0 0 RemoveSynth d1 0
in sinOsc AR (latch t t) 0 * 0.1
