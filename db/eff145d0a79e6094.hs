-- wind metals (jmcc) ; texture=overlap,5,2,12,inf ; monad
uid_st_eval (do
  let n = 6
  base <- expRandM 60 4000
  rng <- randM 500 8000
  n0 <- replicateM 2 (brownNoiseM ar)
  r0 <- expRandM 0.125 0.5
  n1 <- lfNoise1M kr r0
  f <- sequence (replicate n (randM base (base + rng)))
  dt <- sequence (replicate n (randM 0.1 2))
  let exc = mce n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
      k = klankSpec f (replicate n 1) dt
      s = klank exc 1 0 1 k
  return (softClip (s * 0.1)))
