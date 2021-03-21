-- wind metals (jmcc) ; event-control
let f c (g,x,y,z,_,_,_,_,_,_) =
      let n = 6
          base = linExp x 0 1 60 4000
          rng = tRand (c,'β') 500 8000 g
          n0 = mce2 (brownNoise (c,'γ') AR) (brownNoise (c,'δ') AR)
          r0 = tExpRand 'ε' 0.125 0.5 g
          n1 = lfNoise1 'ζ' KR r0
          fq = X.rtRandN n 'η' base (base + rng) g
          dt = X.rtRandN n 'θ' 0.1 2 g
          exc = n0 * 0.01 * z * lagUD g y 2
          k = klankSpec_mce fq (mce (replicate n 1)) dt
          s = dynKlank exc 1 0 1 k
      in softClip (dynKlank exc 1 0 1 k)
in mix (rEventVoicer 16 f) * control KR "gain" 1
