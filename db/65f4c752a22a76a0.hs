-- bowed string (jmcc) ; event control ; id
let f (c,g,_,y,z,_,_,_,p,_,_) =
      let n0 = mce2 (brownNoiseId (c,'α') ar) (brownNoiseId (c,'β') ar)
          r0 = expRandId (c,'γ') 0.125 0.5
          r1 = randId (c,'δ') 0.7 0.9
          r2 = X.randNId 12 (c,'ε') 1.0 3.0
          fq = unitCps p
          n1 = lfNoise1Id (c,'ζ') kr r0
          exc = n0 * 0.005 * z * lagUD g (y * 0.1) (y * 4)
          geom n i m = mce (take n (iterate (* m) i))
          iota n i m = mce (take n (iterate (+ m) i))
          d = klankSpec_mce (iota 12 fq fq) (geom 12 1 r1) r2
      in softClip (dynKlank exc 1 0 1 d)
in mix (eventVoicer 16 f) * control kr "gain" 0.75
