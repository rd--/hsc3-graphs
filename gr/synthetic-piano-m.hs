-- synthetic piano (jmcc) #3

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

-- > g <- synthetic_piano
synthetic_piano :: UId m => m UGen
synthetic_piano = do
  n <- iRandM 36 90
  f <- randM 0.1 0.5
  ph <- randM 0 1
  let s = impulse AR f ph * 0.1
      e = decay2 s 0.008 0.04
      c i = do n0 <- lfNoise2M AR 3000
               let o = [-0.05,0,0.04] !! i
                   dt = 1 / midiCPS (n + o)
               return (combL (n0 * e) dt dt 6)
      l = ((n - 36) / 27) - 1
  c_ <- mixFillM 3 c
  return (pan2 c_ l 1)

main :: IO ()
main = O.overlapTextureU (6,0,6,maxBound) =<< synthetic_piano

{-
audition . out 0 =<< mixFillM 6 (const synthetic_piano)
-}
