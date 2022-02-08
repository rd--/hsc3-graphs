-- shaper ; event control
let f (_,g,_,y,z,o,_,_,p,_,_) =
      let s = sinOsc ar (unitCps p) 0 * y
          b = asLocalBuf (Gen.chebyShaperTbl 256 [1, 0, 1, 1, 0, 1])
      in pan2 (shaper b s) (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 1.0
