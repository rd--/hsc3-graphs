-- rongs ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig1 g controlDur
          f0 = midiCPS (x * 88 + 20)
          structure = 0.5 + ry * tRand 'α' (-1) 1 tr
          brightness = 0.5 + rx * tRand 'β' (-1) 1 tr
          damping = y * 0.25
          accent = 0.99
          stretch = 0.5 + z * tRand 'γ' (-0.5) 0.5 tr
          position = y * 0.5
          loss = 0.25 + o * tRand 'δ' (-0.1) 0.1 tr
          sig = X.rongs AR tr tr f0 structure brightness damping accent stretch position loss
      in pan2 (leakDC sig 0.995) (o * 2 - 1) (lagUD z 0 2)
in mix (rEventVoicer 6 f) * control KR "gain" 1
