-- three-cpsw (rd, 2006-10-30) ; monad
uid_st_eval (do
  t <- dustM kr (mce2 12 18)
  f0 <- tRandM 1 64 t
  f1 <- lfNoise0M kr f0
  a <- tRandM 0.0 0.5 t
  dt <- tRandM 0.975 1.025 t
  dh <- tRandM 0.750 0.7505 t
  let f = f1 * mce2 9000 12000 + 9500
      o = saw ar f + saw ar (f * dh) + saw ar (f * dt)
  return (clip2 (o * a) 0.75 * 0.15))
