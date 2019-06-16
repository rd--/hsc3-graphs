-- | why supercollider (jmcc) #0

import Sound.SC3 {- hsc3 -}

why_supercollider_m :: UId m => m UGen
why_supercollider_m = do
  let r = do
        n1 <- dustM AR 0.2
        n2 <- randM 200 3200
        return (resonz (n1 * 50) n2 0.003)
  s <- fmap mix (mce_genM r 10)
  let c = do
        n1 <- randM 0 0.1
        n2 <- lfNoise1M KR n1
        return (combL (delayN s 0.048 0.048) 0.1 (n2 * 0.04 + 0.05) 15)
  y <- fmap mix (mce_genM c 7)
  let f i = do
        n1 <- randM 0 0.05
        n2 <- randM 0 0.05
        return (allpassN i 0.05 (mce2 n1 n2) 1)
  x <- chainM 4 f y
  return (s + 0.2 * x)

-- > synthstat_wr why_supercollider
why_supercollider :: UGen
why_supercollider = uid_st_eval why_supercollider_m
