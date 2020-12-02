-- midEQ
let i = pinkNoise 'α' AR * 0.1 + sinOsc AR 600 0 * 0.05
    f = sinOsc KR 0.2 (0.5 * pi) * 2 + 600
in midEQ i f 0.01 (-24)
