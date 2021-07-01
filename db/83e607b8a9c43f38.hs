-- tiRand ; monadic variant
uid_st_eval
 (do l <- tiRandM (-1) 1 =<< dustM kr 10
     n <- pinkNoiseM ar
     return (pan2 (n * 0.1) l 1))
