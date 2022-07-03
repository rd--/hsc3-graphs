-- analogBassDrum ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCps (x * 25 + 24)
          tr = trig g controlDur
          selffm = tRandId 'α' 0.1 0.9 tr
          sig = X.analogBassDrum ar tr 0 z freq y rx (ry `in_range` (0.1,0.2)) selffm
      in pan2 sig (o * 2 - 1) 1
in mix (voicer 16 f) * control kr "gain" 2
