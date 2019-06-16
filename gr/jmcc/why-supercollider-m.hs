-- why supercollider (jmcc) #0

import Data.Function {- base -}

import Sound.SC3.Common {- hsc3 -}
import qualified Sound.SC3.Server as SC3 {- hsc3 -}

import Sound.SC3.UGen.M {- hsc3-m -}

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider =
    let r = resonz (dust AR 0.2 * 50) (rand 200 3200) 0.003
        s = share (mix (dup 10 r))
        c = combL (delayN s 0.048 0.048) 0.1 (lfNoise1 KR (rand 0 0.1) * 0.04 + 0.05) 15
        y = share (mix (dup 7 c))
        f i = allpassN i 0.05 (mce2 (rand 0 0.05) (rand 0 0.05)) 1
        x = foldl (&) y (replicate 4 f)
    in s + 0.2 * x

main :: IO ()
main = audition_st why_supercollider

wr :: IO ()
wr = do
  let dir = "/home/rohan/sw/hsc3-graphs/scsyndef"
  SC3.synthdefWrite_dir dir (synthdef "why-supercollider-m.hs" (out 0 why_supercollider))
