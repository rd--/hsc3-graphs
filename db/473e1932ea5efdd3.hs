-- demandEnvGen ; Gate, mouse x on right side of screen toggles gate
let n = roundTo (dwhiteId 'α' dinf 300 1000) 100
    x = mouseX kr 0 1 Linear 0.2
    g = x >** 0.5
    f = demandEnvGen ar n 0.1 5 0.3 g 1 1 0 1 DoNothing
in sinOsc ar (f * mce2 1 1.21) 0 * 0.1
