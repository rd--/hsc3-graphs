-- grainBuf ; requires=buf ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let b = control kr "buf" 0
          e = -1
          tr = impulse ar (y * 60 + 10) 0
      in grainBuf 2 tr (ry * 0.5) b (1 + (rx * 0.1)) x 2 o e 512 * z * g
in mix (eventVoicer 16 f) * control kr "gain" 2
