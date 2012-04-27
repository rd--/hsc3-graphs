-- sidereal time (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

sidereal_time :: UGen
sidereal_time =
  let p = 15
      z = let y = let fr = uclone' 'a' p (expRand 'a' 100 6000)
                      rt = uclone' 'a' p (rand 'a' 2 6)
                  in klankSpec fr (replicate p 1) rt
          in uclone 'a' 2 y
      f = xLine KR (expRand 'α' 40 300) (expRand 'β' 40 300) 12 DoNothing
      t = let e = lfNoise2 'γ' KR (rand 'δ' 0 8)
          in lfPulse AR f 0 (rand 'ε' 0.1 0.9) * 0.002 * max 0 e
      o = distort (klank t 1 0 1 (mceTranspose z)) * 0.1
  in combN o 0.6 (rand 'ζ' 0.1 0.6) 8 + mceReverse o

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) sidereal_time

{-
audition (out 0 sidereal_time)
-}
