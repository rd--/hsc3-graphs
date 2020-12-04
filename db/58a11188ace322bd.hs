-- dbufwr ; monadic graph
uid_st_eval (do
  let b = asLocalBuf 'α' (replicate 24 210)
  s1 <- dseriesM 30 0 3
  s2 <- dseriesM 30 0 1
  s3 <- dseriesM 16 1 1
  s4 <- dwhiteM 8 1 16
  s5 <- dseqM dinf (mce2 s3 s4)
  wt <- dustM KR 1                  {- write trigger -}
  rp <- dseriesM dinf 0 1           {- read pointer -}
  wp <- dseqM dinf (mce2 s1 s2)     {- write pointer -}
  r <- dbufrdM b rp Loop            {- reader -}
  w <- dbufwrM b wp (s5 * 60) Loop  {- writer -}
  let d = demand wt 0 w
      f = lag (demand (impulse KR 16 0) 0 r) 0.01
      o = sinOsc AR (f * mce2 1 1.01) 0 * 0.1
  return (mrg [d, out 0 o]))
