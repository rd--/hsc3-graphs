-- blip ; event control (p)
let f _ (g,_,_,z,o,_,_,p,px,py) =
      let f0 = midiCPS (p + px)
          nh = max 0 py * 10 + 1
      in pan2 (blip AR f0 nh) (o * 2 - 1) (g * z)
in mix (eventVoicer 16 f) * control KR "gain" 0.5
