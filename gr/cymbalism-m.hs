-- cymbalism (jmcc) #2

import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Monad {- hsc3 -}

cymbalism :: (Functor m,UId m) => m UGen
cymbalism = do
  let p = replicate 15
  f1 <- rand 500 2500
  f2 <- rand 0 8000
  let y = do f <- sequence (p (rand f1 (f1 + f2)))
             rt <- sequence (p (rand 1 5))
             return (klankSpec f (p 1) rt)
  z <- clone 2 y
  n <- fmap (* 0.03) (whiteNoise AR)
  tf <- rand 0.5 3.5
  let t = impulse AR tf 0
      s = decay t 0.004 * n
  return (klank s 1 0 1 (mceTranspose z))

main :: IO ()
main = overlapTextureU (3,6,6,maxBound) =<< cymbalism

{-
main = audition . out 0 =<< cymbalism
-}
