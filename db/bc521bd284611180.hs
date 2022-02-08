-- osc ; mouse frequency control
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5])
in osc ar tbl (mouseX kr 110 220 Exponential 0.2) 0 * 0.1
