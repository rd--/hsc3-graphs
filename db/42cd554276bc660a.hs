-- stringVoice ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCps (x * 25 + 36)
          tr = trig g controlDur
          sig = X.stringVoice ar tr 0 freq z y rx (ry * 2)
      in pan2 sig (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 1
