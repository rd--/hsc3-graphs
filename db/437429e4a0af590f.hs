-- shaper ; hear waveshaper at pure (sin) tone ; local wavetable
let z = sinOsc ar 300 0 * line kr 0 1 6 DoNothing
    t = Gen.chebyShaperTbl 256 [1, 0, 1, 1, 0, 1]
in shaper (asLocalBuf t) z * 0.1
