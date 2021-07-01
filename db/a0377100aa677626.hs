-- combC ; with negative feedback
let n = whiteNoiseId 'α' ar * 0.02
    dt = xLine kr 0.0001 0.01 20 RemoveSynth
in combC n 0.01 dt (-0.2)
