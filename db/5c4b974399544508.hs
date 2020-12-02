-- latch ; c.f. LFNoise0
let n1 = latch (whiteNoise 'α' AR) (impulse AR 9 0)
    n2 = lfNoise0 'α' KR 9
in blip AR (mce2 n1 n2 * 400 + 500) 4 * 0.2
