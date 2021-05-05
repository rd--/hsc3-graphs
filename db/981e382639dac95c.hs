-- pluck ; event control
let f c (g,x,y,z,o,_,_,_,_,_) =
      let n = whiteNoise (c,'α') AR * z
          dl_max = 1 / 220
          dl = dl_max * (1 - x * 0.9)
          sig = pluck n g dl_max dl 10 (y / 3)
      in pan2 sig (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control KR "gain" 2
