-- cOsc ; modulate beat frequency with mouseX
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10])
in cOsc ar tbl 200 (mouseX kr 0 4 Linear 0.2) * 0.1
