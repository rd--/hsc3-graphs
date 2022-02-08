-- ctl16Voicer ; 8 voices of 16 control inputs ; applied at inputs as above ignores every other 8-block
let f _ ((c1,c2,c3,c4,c5,c6,c7,_),_) =
      let freq = midiCps (48 + c1 * 24)
          nh = c2 * 200
          pan = sinOsc kr (c3 * 2) 0 * c4
          amp = c5 + (sinOsc kr c6 0 * c7)
      in pan2 (blip ar freq nh) pan amp
in mix (ctl16Voicer 8 f) * control kr "gain" 0.1
