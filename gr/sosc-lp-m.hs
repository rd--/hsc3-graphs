-- sosc-lp (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

dustR' :: UId m => Rate -> UGen -> UGen -> m UGen
dustR' r lo hi = do
  n1 <- dwhiteM 1 lo hi
  n2 <- whiteNoiseM r
  d <- dseqM dinf n1
  return (tDuty r d 0 DoNothing (abs n2) 1)

setup :: Transport m => m ()
setup = do
  let a = [60, 71, 89, 65, 36, 57, 92, 97, 92, 97]
      b = [71, 89, 60, 57, 65, 36, 95, 92, 93, 97]
  _ <- async (b_alloc 10 9 1)
  _ <- async (b_alloc 11 9 1)
  send (b_setn1 10 0 a)
  send (b_setn1 11 0 b)

sosc_lp :: UGen -> UGen -> UGen
sosc_lp t n =
    let d_env = decay2 t 0.002 2.5
        idx = stepper t 0 0 15 1 0
        f1 = let l = (bufRdL 1 KR 10 idx Loop - 24)
                 r = (bufRdL 1 KR 11 idx Loop - 24)
             in midiCPS (mce2 l r)
        f2 = f1 + n * 1.2
        o1 = sinOsc AR f1 0 * d_env
        o2 = sinOsc AR f2 0 * d_env
    in (o1 + o2) * 0.2

sosc_lp_m :: UId m => m UGen
sosc_lp_m = do
  clk <- dustR' KR 0.2 0.9
  n <- lfNoise0M KR (mce2 1 3)
  return (sosc_lp clk n)

main :: IO ()
main = withSC3 (setup >> sosc_lp_m >>= play . out 0)

-- > withSC3 resetter
resetter :: Transport m => m ()
resetter = do
  let a = [71, 60, 65, 89, 36, 57, 95, 97, 92, 97]
      b = [89, 71, 60, 65, 57, 36, 92, 95, 93, 97]
  send (b_setn1 10 0 a)
  send (b_setn1 11 0 b)
