-- swept resonant noise (jmcc) #2 ; event control
let f _ (g,x,y,z,_,_,_,_,_,_) =
      let flt src _ =
            let np = 10
                spec = klankSpec_mce
                  ((x + 0.5) * X.rLinRandN np 80 10080 0)
                  (mce (replicate np 1))
                  (X.rRandN np 0.5 2.5)
            in dynKlank src 1 0 1 spec
          f0 = (0.25 + y) * rand 0.1 0.3
          f1 = midiCPS (fSinOsc kr f0 0 * rand 0 24 + rand 36 84)
          sw = resonz (whiteNoise ar * 0.007) f1 0.1
      in mceFill 2 (flt sw) * z * lag g 0.1
in mix (eventVoicer 16 f) * control kr "gain" 1
