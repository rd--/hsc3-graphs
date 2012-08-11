-- ccomb (rd)

import Sound.SC3.Monad {- hsc3 -}

ccomb :: (Functor m,UId m) => m UGen
ccomb = do
  let rng l r i = linLin i (-1) 1 l r
      lwr = 48
      flwr = midiCPS lwr
      spart t = do n <- fmap (rng lwr 72.0) (lfNoise2 KR 0.1)
                   e <- fmap (decay2 t 0.01) (tRand 0.05 0.75 t)
                   x <- fmap (* e) (whiteNoise AR)
                   m <- lfNoise2 KR 0.1
                   let f = lag (midiCPS n) 0.25
                       m' = rng 1 8 m
                   return (combC x (recip flwr) (recip f) m')
  t <- dust KR (mce2 0.75 0.35)
  return . (* 0.1) . sum =<< sequence (replicate 12 (spart t))

main :: IO ()
main = audition . out 0 =<< ccomb
