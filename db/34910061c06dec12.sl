{- Hpf -}
let n = Hpf(PinkNoise(), [3000 11000]);
Pan2(n, SinOsc([1 / 7, 1 / 13], [0, pi]), 0.1).Mix
