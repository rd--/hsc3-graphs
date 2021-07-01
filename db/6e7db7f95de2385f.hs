-- demandEnvGen ; lfBrownNoise
let y = mouseY kr 1 100 Exponential 0.2
    lvl = dbrownId 'β' dinf (-0.1) 0.1 0.1
    dur = sampleDur * y
in demandEnvGen ar lvl dur 1 0 1 1 1 0 1 RemoveSynth
