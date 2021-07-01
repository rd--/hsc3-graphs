-- tRand ; monadic variant
uid_st_eval (
  do t <- dustM kr (mce2 5 12)
     f <- tRandM (mce2 200 1600) (mce2 500 3000) t
     return (sinOsc ar f 0 * 0.1))
