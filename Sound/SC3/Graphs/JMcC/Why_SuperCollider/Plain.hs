-- | why supercollider (jmcc) #0
module Sound.SC3.Graphs.JMcC.Why_SuperCollider.Plain where

import Data.Function {- base -}
import Sound.SC3 {- hsc3 -}

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider =
  let r z = resonz (dust z AR 0.2 * 50) (rand z 200 3200) 0.003
      s = sum_opt (map r (id_seq 10 'α'))
      c z = combL (delayN s 0.048 0.048) 0.1 (lfNoise1 z KR (rand z 0 0.1) * 0.04 + 0.05) 15
      y = sum_opt (map c (id_seq 7 'β'))
      f z i = allpassN i 0.05 (mce2 (rand (z,'γ') 0 0.05) (rand (z,'δ') 0 0.05)) 1
      x = foldl (&) y (map f (id_seq 4 'ε'))
  in s + 0.2 * x
