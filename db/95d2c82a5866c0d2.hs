-- ctl
let f _ (c1,c2,c3,c4,c5,c6,c7,_c8) =
      let freq = midiCPS (48 + c1 * 24)
          nh = c2 * 200
          pan = sinOsc KR (c3 * 2) 0 * c4
          amp = c5 + (sinOsc KR c6 0 * c7)
      in pan2 (blip AR freq nh) pan amp
in mix (ctl8Voicer 16 f) * control KR "gain" 0.1
