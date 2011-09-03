-- aleatoric quartet (jmcc)

import Sound.SC3.Monadic

aleatoric_quartet :: (Functor m,UId m) => m UGen
aleatoric_quartet = do
  let base_mn = control KR "note" 66
      amp = control KR "ampl" 0.07
      density = mouseX' KR 0.01 1 Linear 0.1
      dmul = recip density * 0.5 * amp
      dadd = amp - dmul
      (>=>) f g = \x ->   f x >>= g
      chain n f = foldl (>=>) return (replicate n f)
      rapf i = do r <- clone 2 (rand 0 0.05)
                  return (allpassN i 0.05 r 1)
      mk_f = do i0 <- iRand 0 2
                let r0 = select i0 (mce [1, 0.5, 0.25])
                r1 <- rand (-30) 30
                n0 <- lfNoise0 KR r0
                let m = n0 * 7 + base_mn + r1
                    m' = lag (roundTo m 1) 0.2
                return (midiCPS m')
      mk_s = do f <- fmap recip mk_f
                r <- rand (-1) 1
                x <- do n0 <- pinkNoise AR
                        n1 <- lfNoise1 KR 8
                        return (n0 * max 0 (n1 * dmul + dadd))
                return (pan2 (combL x 0.02 f 3) r 1)
  g <- chain 5 rapf =<< fmap sum (sequence (replicate 4 mk_s))
  return (leakDC g 0.995)

main :: IO ()
main = audition . out 0 =<< aleatoric_quartet
