-- harmonic tumbling (jmcc) #1

import Sound.SC3

harmonic_tumbling :: UGen
harmonic_tumbling =
  let f = 80
      p = 10::Int
      t = xLine KR (mce2 10 11) 0.1 60 DoNothing
      o h = let n = dust h KR t
                r = rand h 0.25 0.5
                e = decay2 (n * 0.02) 0.005 r
            in fSinOsc AR (f * (fromIntegral h + 1)) 0 * e
  in sum (map o [0..p])

main :: IO ()
main = audition (out 0 harmonic_tumbling)
