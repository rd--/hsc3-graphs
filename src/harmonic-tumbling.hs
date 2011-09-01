-- harmonic tumbling (jmcc)

import Sound.SC3.Monadic

harmonic_tumbling :: UId m => m UGen
harmonic_tumbling = do
  let f = 80
      p = 10
      t = xLine KR (mce2 10 11) 0.1 60 DoNothing
      o h = do n <- dust KR t
               r <- rand 0 0.5
               let e = decay2 (n * 0.02) 0.005 r
               return (fSinOsc AR (f * (h + 1)) 0 * e)
  return.sum =<< mapM o [0..p]

main :: IO ()
main = audition . out 0 =<< harmonic_tumbling
