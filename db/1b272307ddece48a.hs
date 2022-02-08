-- osc ; fixed frequency wavetable oscillator ; c.f. bGen
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5])
in osc ar tbl 220 0 * 0.1
