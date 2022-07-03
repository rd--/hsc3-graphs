-- analogSnareDrum ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCps (x * 25 + 36)
          tr = trig g controlDur
          sig = X.analogSnareDrum ar tr 0 z freq y rx (ry * 2)
      in pan2 sig (o * 2 - 1) (lagUD g 0 2)
in mix (voicer 16 f) * control kr "gain" 0.25
