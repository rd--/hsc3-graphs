-- blip ; event control (p)
let f _ (g,_,_,z,o,_,_,p,px,py) =
      let f0 = midiCps (p + px)
          nh = max 0 py * 10 + 1
      in pan2 (blip ar f0 nh) (o * 2 - 1) (g * z)
in mix (eventVoicer 16 f) * control kr "gain" 0.5
