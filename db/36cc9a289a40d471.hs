-- pluck ; event control ; gateReset ; p+px
let f _ (g,_,y,z,o,_,_,p,px,_) =
      let n = whiteNoise 'α' AR * z
          dl_max = 1 / 8
          (gt,tr) = eventGateReset g p
          dl = 1 / midiCPS (p + px * 1)
      in pan2 (pluck n gt dl_max dl 10 (y / 3)) (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control KR "gain" 2
