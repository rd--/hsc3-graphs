-- harmonic tumbling (jmcc) #1

import Sound.SC3 {- hsc3 -}

harmonic_tumbling :: UId m => m UGen
harmonic_tumbling = do
  let f = 80
      p = 10
      t = xLine KR (mce2 10 11) 0.1 60 DoNothing
      o h = do n <- dustM KR t
               r <- randM 0 0.5
               let e = decay2 (n * 0.02) 0.005 r
               return (fSinOsc AR (f * (h + 1)) 0 * e)
  fmap sum (mapM o [0..p])

main :: IO ()
main = audition . out 0 =<< harmonic_tumbling
