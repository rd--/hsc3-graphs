-- | why supercollider (jmcc) #0
module Sound.SC3.Graphs.JMcC.Why_SuperCollider where

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Common.Base as Base {- hsc3 -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

-- > synthstat_wr why_supercollider_plain
why_supercollider_plain :: UGen
why_supercollider_plain =
  let r z = resonz (dust z AR 0.2 * 50) (rand z 200 3200) 0.003
      s = sum_opt (map r (id_seq 10 'α'))
      c z = combL (delayN s 0.048 0.048) 0.1 (lfNoise1 z KR (rand z 0 0.1) * 0.04 + 0.05) 15
      y = sum_opt (map c (id_seq 7 'β'))
      f z i = allpassN i 0.05 (RDU.randN 2 z 0 0.05) 1
      x = Base.compose_l (map f (id_seq 4 'γ')) y
  in s + 0.2 * x
