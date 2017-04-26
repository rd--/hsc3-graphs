-- oscillator cluster (rd)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

oscillator_cluster_m :: UId m => m UGen
oscillator_cluster_m = do
  let ln a b d = line KR a b d RemoveSynth
      rln r a b d = fmap (\n -> ln (a + n) b d) (randM 0 r)
      prt d a cf = do r1 <- randM cf (cf + 2)
                      r2 <- rln 1 5 0.01 d
                      r3 <- rln 10 20 0 d
                      r4 <- randM 0.1 0.2
                      let f = mce2 cf r1 + sinOsc KR r2 0 * r3
                          o = fSinOsc AR f 0
                          e = decay2 (impulse AR 0 0) r4 d * a
                      return (o * e)
      np = 12
      fp = sequence (replicate np (randM 220 660))
  d <- randM 4 7
  a <- randM 0.01 0.05
  fmap sum (mapM (prt d a) =<< fp)

oscillator_cluster :: UGen
oscillator_cluster = uid_st_eval oscillator_cluster_m

main :: IO ()
main = do
  let s = synthdef "oscillator_cluster" (out 0 oscillator_cluster)
      p = [("dur",P.rand 'α' [0.25,0.5,1,3,5])]
  audition (P.sbind1 (s,p))

{-
let otu = Sound.SC3.Lang.Control.OverlapTexture.overlapTextureU
otu (3,1,5,maxBound) oscillator_cluster
-}
