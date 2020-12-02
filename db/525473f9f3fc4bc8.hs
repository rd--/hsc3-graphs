-- spreader
let theta = pi / 2
    filtsPerOctave = 8
in X.spreader AR (pinkNoise 'α' AR * 0.1) theta filtsPerOctave
