-- cymbalism (jmcc) #2 ; event control
let f c (g,x,y,z,_,_,_,_,_,_) =
      let enumFromN e i = let j = fromEnum e in [j .. j + i]
          mk_spc n =
            let f1 = x * 2000 + 500
                f2 = rand (c,n) 0 8000
                f3 = map (\e -> tRand (c,e) f1 (f1 + f2) g) (enumFromN n 15)
                rt = map (\e -> tRand (c,e) 1 5 g) (enumFromN n 15)
            in klankSpec f3 (replicate 15 1) rt
          spc = mce2 (mk_spc 'α') (mk_spc 'β')
          whn = whiteNoise (c,'γ') AR * z * 0.1
          sig = decay (trig g controlDur) (y * 0.01) * whn
      in dynKlank sig 1 0 1 (mceTranspose spc)
in mix (eventVoicer 16 f) * control KR "gain" 1
