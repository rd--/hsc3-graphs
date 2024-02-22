{- Osc ; sineTable -}
let c = 4096.sineTable(1 / 1:3, [0]).normalize(0, 1).asWavetable.asLocalBuf;
Osc(c, MouseX(222, 555, 1, 0.2), 0) * 0.1
