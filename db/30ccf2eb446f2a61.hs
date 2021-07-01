-- whiteNoise ; monadic form
uid_st_eval (do
  n <- whiteNoiseM ar
  t <- dustM ar (mce [3, 7])
  f <- tExpRandM 20 1800 t
  bw <- tExpRandM 0.001 1 t
  let e = decay2 t 0.01 0.2
  return (resonz (n * e) f bw))
