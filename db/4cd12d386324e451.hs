-- osc ; as frequency modulator
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5])
in osc ar tbl (osc ar tbl (xLine kr 1 1000 9 RemoveSynth) 0 * 200 + 800) 0 * 0.1
