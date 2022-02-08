-- osc ; modulate frequency
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5])
in osc ar tbl (xLine kr 2000 200 1 DoNothing) 0 * 0.1
