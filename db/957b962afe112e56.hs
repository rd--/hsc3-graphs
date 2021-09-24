-- grainFM ; event control
let f _ (g,x,y,z,o,rx,ry,p,px,_) =
      let tr = impulse ar (y * 64 + 10) 0
          cf = midiCps (p + px)
          mf = (cf * 1.5) + ((1 - x) * z * cf)
      in grainFM 2 tr (ry * 0.25) cf mf (1 + (rx * 0.25)) o (-1) 512 * z * lagUD g 0 2
in mix (eventVoicer 16 f) * control kr "gain" 0.5
