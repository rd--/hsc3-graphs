-- | why supercollider (jmcc) #0
module Sound.SC3.Graphs.JMcC.Why_SuperCollider.Unsafe where

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Common.Base as Base {- hsc3 -}

import Sound.SC3.UGen.Unsafe {- hsc3-unsafe -}

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider =
  let r _ = resonz (dustU AR 0.2 * 50) (randU 200 3200) 0.003
      s = sum_opt (cpy 10 r)
      c _ = combL (delayN s 0.048 0.048) 0.1 (lfNoise1U KR (randU 0 0.1) * 0.04 + 0.05) 15
      y = sum_opt (cpy 7 c)
      f i = allpassN i 0.05 (mce2 (randU 0 0.05) (randU 0 0.05)) 1
      x = Base.compose_l (replicate 4 f) y
  in s + 0.2 * x
