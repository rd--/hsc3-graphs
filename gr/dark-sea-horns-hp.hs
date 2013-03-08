{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- http://sccode.org/1-j#c51 (jl)

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.UGen.External.RDU.Monad {- sc3-rdu -}

chain :: Monad m => Int -> (b -> m b) -> b -> m b
chain n fn = foldr (<=<) return (replicate n fn)

dark_sea_horns :: UId m => m UGen
dark_sea_horns = do
  let n = lfNoise1
  let x = localIn 2 AR
  let a = tanh (sinOsc AR 65 (x * #(n AR 0.1) * 3) * #(n AR 3) * 6)
  let f i = do
        return (allpassN i 0.3 #(randN 2 0.1 0.3) 5)
  let o = tanh #(chain 9 f a)
  return (mrg2 o (localOut o))

main :: IO ()
main = audition . out 0 =<< dark_sea_horns
