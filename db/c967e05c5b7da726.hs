-- lfClipNoise ; c.f. lfDClipNoise
let x = mouseX kr 0.1 1000 Exponential 0.2
    n = lfClipNoiseId 'β' ar x
in sinOsc ar (n * 200 + 500) 0 * 0.05
