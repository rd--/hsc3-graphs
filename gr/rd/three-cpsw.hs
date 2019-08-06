-- three-cpsw (rd, 2006-10-30)

import Sound.SC3 {- hsc3 -}

three_cpsw :: UGen
three_cpsw =
    let t = dust 'α' KR (mce2 12 18)
        f0 = tRand 'β' 1 64 t
        f1 = lfNoise0 'γ' KR f0
        a = tRand 'δ' 0.0 0.5 t
        dt = tRand 'ε' 0.975 1.025 t
        dh = tRand 'ζ' 0.750 0.7505 t
        f = f1 * mce2 9000 12000 + 9500
        o = saw AR f + saw AR (f * dh) + saw AR (f * dt)
    in clip2 (o * a) 0.75

three_cpsw_m :: UId m => m UGen
three_cpsw_m = do
  t <- dustM KR (mce2 12 18)
  f0 <- tRandM 1 64 t
  f1 <- lfNoise0M KR f0
  a <- tRandM 0.0 0.5 t
  dt <- tRandM 0.975 1.025 t
  dh <- tRandM 0.750 0.7505 t
  let f = f1 * mce2 9000 12000 + 9500
      o = saw AR f + saw AR (f * dh) + saw AR (f * dt)
  return (clip2 (o * a) 0.75)

three_cpsw' :: UGen
three_cpsw' = uid_st_eval three_cpsw_m

main :: IO ()
main = audition (out 0 three_cpsw)
