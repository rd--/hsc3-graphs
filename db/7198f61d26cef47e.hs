-- resonators harmonic series (jmcc) #2 ; event control
let f (_,g,_,y,z,o,rx,_,p,_,_) =
      let nharm = 12
          spec _ = let freq = unitCps p
                       series n i j = case n of {0 -> []; _ -> i : series (n - 1) (i + j) j}
                   in klankSpec_mce
                      (mce (series nharm freq freq) + (X.randN nharm (-0.5) 0.5) * rx)
                      (mceFill nharm (\i -> 1 / (i + (2 * y))))
                      (X.randN nharm 0.5 4.5)
          gen n = dynKlank (brownNoise ar * 0.001) 1 0 1 (spec n)
      in pan2 (mceFill 2 gen)  (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 1
