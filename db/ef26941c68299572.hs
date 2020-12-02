-- sinOsc ; modulate freq
let f1 = xLine KR 1 1000 9 RemoveSynth
    f2 = sinOsc AR f1 0 * 200 + 800 -- (-1,1) ; (-200,200) ; (600,1000)
in sinOsc AR f2 0 * 0.25
