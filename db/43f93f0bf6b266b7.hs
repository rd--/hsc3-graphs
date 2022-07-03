-- wind metals (jmcc) ; event-control ; id
let f (c,g,x,y,z,_,_,_,_,_,_) =
      let n = 6
          base = linExp x 0 1 60 4000
          rng = tRandId (c,'β') 500 8000 g
          n0 = mce2 (brownNoiseId (c,'γ') ar) (brownNoiseId (c,'δ') ar)
          r0 = tExpRandId 'ε' 0.125 0.5 g
          n1 = lfNoise1Id 'ζ' kr r0
          fq = X.tRandNId n 'η' base (base + rng) g
          dt = X.tRandNId n 'θ' 0.1 2 g
          exc = n0 * 0.01 * z * lagUD g y 2
          k = klankSpec_mce fq (mce (replicate n 1)) dt
          s = dynKlank exc 1 0 1 k
      in softClip (dynKlank exc 1 0 1 k)
in mix (voicer 16 f) * control kr "gain" 1
