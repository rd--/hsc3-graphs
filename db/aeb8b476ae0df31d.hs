-- tiRand ; osc frequency
uid_st_eval
 (do n <- tiRandM 4 12 =<< dustM KR 10
     let f = n * 150 + (mce [0,1])
     return (sinOsc AR f 0 * 0.1))
