-- cymbalism (jmcc) #2 ; event control
let f (_,g,x,y,z,_,_,_,_,_,_) =
      let mk_spc _ =
            let f1 = x * 2000 + 500
                f3 = mceFill 15 (\_ -> tRand f1 (f1 + rand 0 8000) g)
                rt = mceFill 15 (\_ -> tRand 1 5 g)
            in klankSpec_mce f3 (mceFill 15 (const 1)) rt
          spc = mceFill 2 mk_spc
          whn = whiteNoise ar * z * 0.1
          sig = decay (trig g controlDur) (y * 0.01) * whn
      in dynKlank sig 1 0 1 (mceTranspose spc)
in mix (eventVoicer 16 f) * control kr "gain" 1
