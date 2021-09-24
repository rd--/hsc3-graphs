-- ctl8
let f _ (c1,c2,c3,c4,c5,c6,c7,_c8) =
      let freq = midiCps (48 + c1 * 24)
          nh = c2 * 200
          pan = sinOsc kr (c3 * 2) 0 * c4
          amp = c5 + (sinOsc kr c6 0 * c7)
      in pan2 (blip ar freq nh) pan amp
in mix (ctl8Voicer 16 f) * control kr "gain" 0.1
