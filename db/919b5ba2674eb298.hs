-- demandEnvGen ; lfBrownNoise
let y = mouseY KR 1 100 Exponential 0.2
    lvl = dbrown 'β' dinf (-0.1) 0.1 0.1
    dur = sampleDur * y
in demandEnvGen AR lvl dur 1 0 1 1 1 0 1 RemoveSynth
