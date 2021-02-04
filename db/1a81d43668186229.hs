-- pluck ; event control
let f _ (g,x,y,z,o,rx,_,_) =
      let n = whiteNoise 'α' AR * z
          dl_max = 1 / 220
          dl = dl_max * (1 - x * 0.9)
      in pan2 (pluck n g dl_max dl 10 (y / 3)) (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control KR "gain" 2
