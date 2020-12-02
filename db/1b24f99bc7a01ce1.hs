-- demandEnvGen ; lfNoise1
let y = mouseY KR 0.5 20 Linear 0.2
    lvl = dwhite 'β' dinf (-0.1) 0.1
    dur = sampleDur * y
in demandEnvGen AR lvl dur 5 (-4) 1 1 1 0 1 RemoveSynth
