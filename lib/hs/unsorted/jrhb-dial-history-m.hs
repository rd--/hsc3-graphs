-- dial history (jrhb)

import Data.List {- base -}
import Sound.SC3 {- hsc3 -}

dial_history_m :: UId m => m UGen
dial_history_m = do
  let mfv = [[697,770,852,941],[1209,1336,1477,1633]]
      numbers = [3,1] : [[a,b] | a <- [0..2],b <- [0..2]]
      mce_r = mce . map mce
  n <- dwhiteM dinf 7 12
  w <- dwhiteM 1 2 7
  b <- dbrownM n 0.1 0.2 0.01
  rate <- dseqM dinf (mce2 w b)
  q <- dseqM dinf (mce [1..10])
  g1 <- grayNoiseM AR
  g2 <- grayNoiseM AR
  d <- lfdNoise3M KR 0.5
  let tr = trig (tDuty KR rate 0 DoNothing q 1) 0.09
      pat = latch tr tr
      x = mouseX KR 0 1 Linear 0.2
      h = hasher (pat * x)
      which = trunc (linLin_u h 0 (constant (length numbers))) 1
      both = select which (mce_r numbers)
      dial = select both (mce_r (transpose mfv))
      sig = sinOsc AR dial 0 * 0.05 * tr
      dsig = delayN sig 0.2 (linLin_u d 0 0.01)
      hiss = g1 * 0.01 + hpf (g2 * 0.02) 3000
  return (dsig + hiss)

dial_history :: UGen
dial_history = uid_st_eval dial_history_m

main :: IO ()
main = audition (out 0 dial_history)
