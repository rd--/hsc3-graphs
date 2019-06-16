-- http://permalink.gmane.org/gmane.comp.audio.supercollider.user/100515 (jrhb)

import qualified System.Random as R {- random -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

pat :: UGen
pat = panAz 32 (sinOscFB AR 18 1.4) (sinOscFB AR 0.2 1.4) 1 2 0.5

mat :: Int -> UGen -> UGen
mat n x = splay (sinOscFB AR (RDU.expRandN n 'α' 1 11e3) x * x) 1 1 0 True

main :: IO ()
main = do
  let r = R.randomRs (1,64) (R.mkStdGen 245763)
      f (n0:n) = (mat n0 pat,n)
      f [] = undefined
  O.overlapTextureS (6,2,2,maxBound) f r
