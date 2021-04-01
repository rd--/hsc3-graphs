-- | why supercollider (jmcc) #0

import Data.Function {- base -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Unsafe.Util {- hsc3-unsafe -}

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider =
  let r _ = resonz (dustU AR 0.2 * 50) (randU 200 3200) 0.003
      s = mix (mce_cpy 10 r)
      c _ = combL (delayN s 0.048 0.048) 0.1 (lfNoise1U KR (randU 0 0.1) * 0.04 + 0.05) 15
      y = mix (mce_cpy 7 c)
      f i = allpassN i 0.05 (mce2 (randU 0 0.05) (randU 0 0.05)) 1
      x = foldl (&) y (replicate 4 f)
  in s + 0.2 * x
