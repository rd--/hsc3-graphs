-- spreader
let theta = mouseX KR 0 (pi / 2) Linear 0.2
    filtsPerOctave = 8
in X.spreader AR (pinkNoise 'α' AR * 0.1) theta filtsPerOctave
