-- stkModalBar ; event control
let f _ (g,_,y,z,o,rx,_,p) =
      let tr = g - 0.5
          freq = midiCPS p
          instr = control KR "instrument" 4
          sig = X.stkModalBar AR freq instr ((1 - y) * 127) (y * 127) 64 64 (rx * 127) 127 tr
      in pan2 sig (o * 2 - 1) (latch z g * 3)
in mix (rEventVoicer 16 f) * control KR "gain" 1
