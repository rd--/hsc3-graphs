-- lfClipNoise ; c.f. lfDClipNoise
let x = mouseX KR 0.1 1000 Exponential 0.2
    n = lfClipNoise 'β' AR x
in sinOsc AR (n * 200 + 500) 0 * 0.05
