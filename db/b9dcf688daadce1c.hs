-- shaper ; event control
let f _ (g,_,y,z,o,_,_,p,_,_) =
      let s = sinOsc ar (midiCPS p) 0 * y
          c = Gen.cheby 257 [1,0,1,1,0,1]
          b = asLocalBufId 'α' (to_wavetable_nowrap c)
      in pan2 (shaper b s) (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 1.0
