-- midEQ
let i = pinkNoiseId 'α' ar * 0.1 + sinOsc ar 600 0 * 0.05
    f = sinOsc kr 0.2 (0.5 * pi) * 2 + 600
in midEQ i f 0.01 (-24)
