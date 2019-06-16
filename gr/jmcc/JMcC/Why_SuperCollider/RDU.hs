-- | why supercollider (jmcc) #0
module Sound.SC3.Graphs.JMcC.Why_SuperCollider.RDU where

import Data.Function {- base -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider =
  let r z = resonz (dust z AR 0.2 * 50) (rand z 200 3200) 0.003
      s = mix (mce_gen r 10 'α')
      c z = combL (delayN s 0.048 0.048) 0.1 (lfNoise1 z KR (rand z 0 0.1) * 0.04 + 0.05) 15
      y = mix (mce_gen c 7 'β')
      f z i = allpassN i 0.05 (RDU.randN 2 z 0 0.05) 1
      x = foldl (&) y (map f (id_seq 4 'γ'))
  in s + 0.2 * x
