-- http://permalink.gmane.org/gmane.comp.audio.supercollider.user/100515 (jr)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.UGen.External.RDU.ID {- sc3-rdu -}
import System.Random {- random -}

pat :: UGen
pat = panAz 32 (sinOscFB AR 18 1.4) (sinOscFB AR 0.2 1.4) 1 2 0.5

mat :: Int -> UGen -> UGen
mat n x = splay (sinOscFB AR (expRandN n 'α' 1 11e3) x * x) 1 1 0 True

main :: IO ()
main = do
  let r = randomRs (1,64) (mkStdGen 245763)
      f (n0:n) = (mat n0 pat,n)
  overlapTextureS (6,2,2,maxBound) f r
