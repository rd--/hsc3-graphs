-- swept resonant noise (jmcc) #2 ; event control ; id
let f c (g,x,y,z,_,_,_,_,_,_) =
      let flt src k =
            let np = 10
                spec = klankSpec_mce
                  ((x + 0.5) * X.rLinRandNId np (c,k) 80 10080 0)
                  (mce (replicate np 1))
                  (X.rRandNId np (c,k) 0.5 2.5)
            in dynKlank src 1 0 1 spec
          f0 = (0.25 + y) * randId (c,'β') 0.1 0.3
          f1 = midiCps (fSinOsc kr f0 0 * randId (c,'γ') 0 24 + randId (c,'δ') 36 84)
          sw = resonz (whiteNoiseId (c,'α') ar * 0.007) f1 0.1
      in mce (map (flt sw) ['ε','ζ']) * z * lag g 0.1
in mix (eventVoicer 16 f) * control kr "gain" 1
