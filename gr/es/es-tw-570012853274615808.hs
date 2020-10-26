-- <https://twitter.com/sluyterrific_sc/status/570012853274615808> (es)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.DB.External as X {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.Composite.External as X {- hsc3 -}

dup2 :: (t, t) -> (t -> UGen) -> UGen
dup2 (z1,z2) f = mce2 (f z1) (f z2)

-- | This is not as written but sounds very nicely....
greyhole_no_reorder :: UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen
greyhole_no_reorder i = let (p,q) = unmce2 i in X.greyholeRaw p q

-- > audition (es_tw_570012853274615808 X.greyhole)
-- > audition (es_tw_570012853274615808 greyhole_no_reorder)
es_tw_570012853274615808 :: (UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> UGen) -> UGen
es_tw_570012853274615808 f =
  let t = dup2 ('α','β') (\z -> dust2 z AR 9)
      o = 0.1
      a = lfNoise2 'γ' AR o * 9 + 9
      s = varSaw AR (tExpRand 'δ' 9 5000 t) 0 0.5 * decay t 1
  in f s a 0 o (lfNoise2 'ε' AR 1) (lfNoise2 'ζ' AR 1 + 1) 2 a

main :: IO ()
main = audition (es_tw_570012853274615808 greyhole_no_reorder)
