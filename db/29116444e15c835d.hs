-- latch ; c.f. LFNoise0
let n1 = latch (whiteNoiseId 'α' ar) (impulse ar 9 0)
    n2 = lfNoise0Id 'α' kr 9
in blip ar (mce2 n1 n2 * 400 + 500) 4 * 0.2
