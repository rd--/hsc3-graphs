-- osc ; as phase modulator
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5])
in osc ar tbl 800 (osc ar tbl (xLine kr 20 8000 10 RemoveSynth) 0 * 2 * pi) * 0.1
