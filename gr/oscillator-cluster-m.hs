-- oscillator cluster (rd)

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

oscillator_cluster :: (Functor m,UId m) => m UGen
oscillator_cluster = do
  let ln a b d = line KR a b d RemoveSynth
      rln r a b d = fmap (\n -> ln (a + n) b d) (rand 0 r)
      prt d a cf = do r1 <- rand cf (cf + 2)
                      r2 <- rln 1 5 0.01 d
                      r3 <- rln 10 20 0 d
                      r4 <- rand 0.1 0.2
                      let f = mce2 cf r1 + sinOsc KR r2 0 * r3
                          o = fSinOsc AR f 0
                          e = decay2 (impulse AR 0 0) r4 d * a
                      return (o * e)
      np = 12
      fp = sequence (replicate np (rand 220 660))
  d <- rand 4 7
  a <- rand 0.01 0.05
  fmap sum (mapM (prt d a) =<< fp)

main :: IO ()
main = do
  u <- oscillator_cluster
  let s = synthdef "oscillator_cluster" (out 0 u)
      p = pbind [(K_instr,psynth s),(K_dur,prand 'α' [0.25,0.5,1,3,5] inf)]
  paudition p

{-
audition . (out 0) =<< oscillator_cluster
let otu = Sound.SC3.Lang.Control.OverlapTexture.overlapTextureU
otu (0,6,3,maxBound) =<< oscillator_cluster
-}
