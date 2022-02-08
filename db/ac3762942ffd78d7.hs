-- shaper ; minor variation
let z = sinOsc ar 400 (pi / 2) * line kr 0 1 6 DoNothing
in shaper (asLocalBuf (Gen.chebyShaperTbl 256 [1, 0, 1, 1, 0, 1])) z * 0.1
