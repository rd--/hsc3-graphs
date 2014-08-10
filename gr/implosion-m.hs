-- implosion (rd)

import Sound.SC3 {- hsc3 -}

mkls :: [(UGen,UGen)] -> UGen -> UGen
mkls bp t =
    let e = envCoord bp t 1 EnvLin
    in envGen KR 1 1 0 1 RemoveSynth e

mkrmp :: UGen -> UGen -> UGen -> UGen
mkrmp l r = mkls [(0,l),(1,r)]

pmr_n :: UId m => Rate -> UGen -> UGen -> UGen -> UGen -> UGen -> m UGen
pmr_n rt l0 l1 r0 r1 d = do
  let le = mkrmp l0 r0 d
      re = mkrmp l1 r1 d
  n <- whiteNoiseM rt
  return (linLin_b n le re)

implosion :: UId m => m UGen
implosion = do
  n0 <- randM (-1) 0
  n1 <- randM 0 1
  d  <- randM 7.5 13.5
  f0 <- randM 10990 16220
  f1 <- randM  9440 19550
  f <- pmr_n AR 440 f0 f1 f1 d
  l <- pmr_n KR n0 n1 0 0 d
  a <- pmr_n KR 0.1 0.6 0 0 d
  return (pan2 (saw AR f) l a)

main :: IO ()
main = audition . out 0 =<< implosion
