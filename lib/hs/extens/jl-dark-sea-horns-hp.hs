-- http://sccode.org/1-j#c51 (jl)
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU.Monadic as RDU {- sc3-rdu -}

dark_sea_horns :: UId m => m UGen
dark_sea_horns = do
  let n = lfNoise1M
  let x = localIn' 2 AR
  let a = tanh (sinOsc AR 65 (x * #(n AR 0.1) * 3) * #(n AR 3) * 6)
  let f i = do return (allpassN i 0.3 #(RDU.randNM 2 0.1 0.3) 5)
  let o = tanh #(chainM 9 f a)
  return (mrg2 o (localOut o))

main :: IO ()
main = audition . out 0 =<< dark_sea_horns
