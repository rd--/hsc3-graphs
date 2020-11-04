import Sound.SC3 {- hsc3 -}

pmi :: UGen -> UGen
pmi n =
  let cf = rand 'α' 0 2000
      mf = rand 'β' 0 800
      pme = rand 'γ' 0 12
      l = rand 'δ' (-1) 1
      pm = line KR 0 pme n DoNothing
  in linPan2 (pmOsc AR cf mf pm 0) l 0.05

{-
import qualified Sound.SC3.Lang.Control.OverlapTexture as L
L.overlapTextureU (0,1,8,maxBound) (pmi 1)
L.overlapTextureU (1,2,7,maxBound) (pmi 2)
L.overlapTextureU (6,6,6,maxBound) (pmi 12)
-}
