-- spreader
let theta = pi / 2
    filtsPerOctave = 8
in X.spreader ar (pinkNoiseId 'α' ar * 0.1) theta filtsPerOctave
