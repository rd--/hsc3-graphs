-- stkModalBar ; event control
let f (_,g,_,y,z,o,rx,_,p,_,_) =
      let tr = g - 0.5
          freq = unitCps p
          instr = control kr "instrument" 4
          sig = X.stkModalBar ar freq instr ((1 - y) * 127) (y * 127) 64 64 (rx * 127) 127 tr
      in pan2 sig (o * 2 - 1) (latch z g * 3)
in mix (voicer 16 f) * control kr "gain" 1
