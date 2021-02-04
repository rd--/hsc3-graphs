-- shaper ; event control
let f _ (g,_,y,z,o,_,_,p) =
      let s = sinOsc AR (midiCPS p) 0 * y
          c = Gen.cheby 257 [1,0,1,1,0,1]
          b = asLocalBuf 'α' (to_wavetable_nowrap c)
      in pan2 (shaper b s) (o * 2 - 1) (z * g)
in mix (rEventVoicer 16 f) * control KR "gain" 1.0
