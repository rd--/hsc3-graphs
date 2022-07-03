-- blip ; event control (p)
let f (_,g,_,_,z,o,rx,_,p,px,_) =
      let f0 = midiCps (p * 127 + px)
          nh = max 0 rx * 10 + 1
      in pan2 (blip ar f0 nh) (o * 2 - 1) (g * z)
in mix (voicer 16 f) * control kr "gain" 0.5
