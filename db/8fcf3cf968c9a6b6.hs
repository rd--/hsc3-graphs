-- tGrains ; requires=buf ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let b = control kr "buf" 0
          tRate = linExp y 0 1 2 200
          ctr = x * bufDur kr b
          du = (ry * 8) / tRate
          tr = impulse ar (y * 60 + 10) 0
      in tGrains 2 tr b (1 + (rx * 0.5)) ctr du o (z * g) 4
in mix (eventVoicer 16 f) * control kr "gain" 2
