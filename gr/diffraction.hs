-- diffraction (rd)

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw =<< diffraction
diffraction ::(Functor m,UId m) => m UGen
diffraction = do
  let p = do let x = mouseX KR 0.001 0.02 Exponential 0.1
                 y = mouseY KR 120 400 Exponential 0.1
             f <- fmap (* mce2 32 64) (lfNoise0 KR 4)
             w <- fmap (* x) (lfNoise0 KR 32)
             z <- fmap (* 0.1) (lfNoise0 KR 2)
             m <- lfNoise0 KR 6
             let s = pulse AR f w
             return (resonz s (y + z) (m * 0.4 + 0.8) * 0.5)
      q = do n <- lfNoise0 KR 128
             s <- p
             return (combN s 0.2 (n * 0.1 + 0.1) 3)
      r = let x = mouseX KR 0.75 1.25 Exponential 0.1
              y = mouseY KR 0.25 1 Exponential 0.1
              f _ = do fr <- fmap (* x) (rand 50 59)
                       am <- fmap (* y) (rand 0.04 0.16)
                       return (sinOsc AR fr 0 * am)
          in liftM2 mce2 (mixFillM 16 f) (mixFillM 12 f)
  fmap sum (sequence [p,q,r])

main :: IO ()
main = audition . out 0 =<< diffraction
