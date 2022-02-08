-- pluck ; event control ; gateReset
let f (_,g,x,y,z,o,_,_,p,_,_) =
      let n = whiteNoiseId 'α' ar * z
          dl_max = 1 / 8
          (gt,tr) = eventGateReset g p
          dx = x - latch x tr
          dl = 1 / midiCps (p * 127 + dx * 8)
      in pan2 (pluck n gt dl_max dl 10 (y / 3)) (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 2
