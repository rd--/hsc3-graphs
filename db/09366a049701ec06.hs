-- whiteNoise ; monadic form, without using do notation
uid_st_eval (
  whiteNoiseM AR >>= \n ->
  dustM AR (mce [3, 7]) >>= \t ->
  tExpRandM 20 1800 t >>= \f ->
  tExpRandM 0.001 1 t >>= \bw ->
  let e = decay2 t 0.01 0.2
  in return (resonz (n * e) f bw))
