-- bowed string (jmcc) ; event control
let f _ (g,x,y,z,_,_,_,p,_,_) =
      let n0 = mce2 (brownNoise ar) (brownNoise ar)
          r0 = expRand 0.125 0.5
          r1 = rand 0.7 0.9
          r2 = X.rRandN 12 1.0 3.0
          fq = midiCPS p
          n1 = lfNoise1 kr r0
          exc = n0 * 0.005 * z * lagUD g (y * 0.1) (y * 4)
          geom n i m = mce (take n (iterate (* m) i))
          iota n i m = mce (take n (iterate (+ m) i))
          d = klankSpec_mce (iota 12 fq fq) (geom 12 1 r1) r2
      in softClip (dynKlank exc 1 0 1 d)
in mix (eventVoicer 16 f) * control kr "gain" 0.75
