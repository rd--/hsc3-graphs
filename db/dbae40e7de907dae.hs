-- dwgSoundBoard ; pluck ; event control
let f (_,g,x,y,z,o,rx,_,_,_,_) =
      let n = whiteNoiseId 'α' ar * (z + y * 0.75)
          dl_max = 1 / 220 -- 110
          dl = dl_max * (1 - x * 0.9)
          sig = pluck n g dl_max dl 10 (linLin y 0 1 0.65 0.80) -- 0.75 1.0
          flt = let m = y * 2
                in X.dwgSoundBoard sig 20 20 (rx * 0.35)
                   (199 * m) (211 * m) (223 * m) (227 * m) (229 * m) (233 * m) (239 * m) (241 * m)
      in pan2 flt (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 1
