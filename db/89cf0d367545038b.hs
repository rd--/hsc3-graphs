-- rongs ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig1 g controlDur
          f0 = midiCps (x * 88 + 20)
          structure = 0.5 + ry * tRandId 'α' (-1) 1 tr
          brightness = 0.5 + rx * tRandId 'β' (-1) 1 tr
          damping = y * 0.25
          accent = 0.99
          stretch = 0.5 + z * tRandId 'γ' (-0.5) 0.5 tr
          position = y * 0.5
          loss = 0.25 + o * tRandId 'δ' (-0.1) 0.1 tr
          modeNum = 2
          cosFreq = 0.25
          sig = X.rongs ar tr tr f0 structure brightness damping accent stretch position loss modeNum cosFreq
      in pan2 (leakDC sig 0.995) (o * 2 - 1) (lagUD z 0 2)
in mix (eventVoicer 6 f) * control kr "gain" 1
