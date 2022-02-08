-- pond life (jmcc) #1 ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let f0 = 20 + tRand 0 (rx * 30) g
          f1 = fSinOsc kr f0 0 * linLin x 0 1 100 400 + linLin y 0 1 500 2500
          a = lfPulse kr (3 / linLin ry 0 1 1 9) 0 (rand 0.2 0.5)
      in pan2 (sinOsc ar f1 0 * a * 0.25) (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 1
