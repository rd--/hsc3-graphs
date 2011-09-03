-- lg-timed (rd)

import Sound.SC3.Monadic

lg_timed :: UId m => m UGen
lg_timed = do
  let timed r y p =
          do d0 <- dser r p
             d1 <- dcons 0 d0
             d2 <- dser r y
             let t = tDuty AR d1 0 RemoveSynth d2 1
             return (latch t t)
      lg u = return (lag u 0.03)
      n = mce [52,76,66,67,68,69]
      a = mce [0.35,0.15,0.04,0.05,0.16,0.07]
      d = mce [0.1,0.5,0.09,0.08,0.07,0.3]
      x = mouseX' KR 0.5 1.25 Linear 0.2
  tn <- lg =<< timed dinf n (d * x)
  ta <- lg =<< timed dinf a (d * x)
  return (sinOsc AR (midiCPS tn) 0 * ta)

main :: IO ()
main = audition . out 0 =<< lg_timed

