-- shaper ; generate table at client and use localBuf
let z = sinOsc ar 300 0 * line kr 0 1 12 DoNothing
    c = Gen.cheby 257 [1,0,1,1,0,1]
    t = to_wavetable_nowrap c
    b = asLocalBufId 'α' t
in shaper b z * 0.1
