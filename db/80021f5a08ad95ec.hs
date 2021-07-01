-- spreader
let theta = mouseX kr 0 (pi / 2) Linear 0.2
    filtsPerOctave = 8
in X.spreader ar (pinkNoiseId 'α' ar * 0.1) theta filtsPerOctave
