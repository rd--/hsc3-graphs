-- warp1 ; requires=buf ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let b = control kr "buf" 0
          p = linLin (lfSaw kr 0.05 0) (-1) 1 0 1
          dur = linLin y 0 1 0.01 0.2
          freqScale = linLin ry 0 1 0.75 1.25
          ol = linLin rx 0 1 2 16
      in pan2 (warp1 1 b x freqScale dur (-1) ol (ry * 0.75) 2) (o * 2 - 1) (z * g)
in mix (voicer 16 f) * control kr "gain" 2
