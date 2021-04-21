-- moogFF
let n = whiteNoise 'α' AR * 0.05
    freq = mouseX KR 100 10000 Exponential 0.1
    gain = mouseY KR 0 4 Linear 0.1
in moogFF n freq gain 0
