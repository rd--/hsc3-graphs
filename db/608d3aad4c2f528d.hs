-- bowed string (jmcc) ; event control
let f c (g,x,y,z,_,_,_,p,_,_) =
      let n0 = mce2 (brownNoise (c,'α') AR) (brownNoise (c,'β') AR)
          r0 = expRand (c,'γ') 0.125 0.5
          r1 = rand (c,'δ') 0.7 0.9
          r2 = X.rRandN 12 (c,'ε') 1.0 3.0
          fq = midiCPS p
          n1 = lfNoise1 (c,'ζ') KR r0
          exc = n0 * 0.005 * z * lagUD g (y * 0.1) (y * 4)
          geom n i z = mce (take n (iterate (* z) i))
          iota n i z = mce (take n (iterate (+ z) i))
          d = klankSpec_mce (iota 12 fq fq) (geom 12 1 r1) r2
      in softClip (dynKlank exc 1 0 1 d)
in mix (rEventVoicer 16 f) * control KR "gain" 0.75
