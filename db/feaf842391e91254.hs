-- moogFF
let n = whiteNoise 'α' AR * 0.05
    y = mouseY KR 100 10000 Exponential 0.1
    x = mouseX KR 0 4 Linear 0.1
in moogFF n y x 0
