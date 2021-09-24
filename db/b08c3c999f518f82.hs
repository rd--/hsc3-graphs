-- pluck ; event control ; gateReset ; p+px
let f _ (g,_,y,z,o,_,_,p,px,_) =
      let n = whiteNoiseId 'α' ar * z
          dl_max = 1 / 8
          (gt,tr) = eventGateReset g p
          dl = 1 / midiCps (p + px * 1)
      in pan2 (pluck n gt dl_max dl 10 (y / 3)) (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 2
