-- tiRand ; monadic variant
uid_st_eval
 (do l <- tiRandM (-1) 1 =<< dustM KR 10
     n <- pinkNoiseM AR
     return (pan2 (n * 0.1) l 1))
