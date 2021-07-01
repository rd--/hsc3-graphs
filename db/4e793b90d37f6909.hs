-- demandEnvGen ; lfNoise1
let y = mouseY kr 0.5 20 Linear 0.2
    lvl = dwhiteId 'β' dinf (-0.1) 0.1
    dur = sampleDur * y
in demandEnvGen ar lvl dur 5 (-4) 1 1 1 0 1 RemoveSynth
