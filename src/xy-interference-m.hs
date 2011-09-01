-- xy-interference-m (rd)

import Sound.SC3.Monadic

xy_interference :: UId m => m UGen
xy_interference = do
  let x = mouseX' KR 20 22000 Linear (mce2 0.005 0.025)
      y = mouseY' KR 20 22000 Linear (mce2 0.005 0.075)
      nd = do n <- lfNoise0 KR (mce2 5 9)
              let a = sinOsc AR (x + n) 0
                  b = sinOsc AR y 0
              return (a * b)
  return.sum =<< sequence (replicate 3 nd)

main :: IO ()
main = audition . (out 0) =<< xy_interference
