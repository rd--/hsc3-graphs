-- urandom (rd)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Data.URandom as R {- hsc3-data -}
import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

-- > audition =<< mk_node
mk_node :: IO UGen
mk_node = do
  [f,g,l] <- R.ur_real_set 3
  let f' = linLin_u f 440 660
      g' = linLin_u g 0.05 0.25
      l' = linLin_u l (-1) 1
  return (pan2 (sinOsc AR f' 0) l' g')

main :: IO ()
main = O.overlapTextureM (3,3,9,maxBound) mk_node
