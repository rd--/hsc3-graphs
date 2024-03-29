-- sc-users, 2007-04-06 (pj) [paul jones] ; monad
uid_st_eval (do
  let insects_m = do
        n1 <- brownNoiseM ar
        n2 <- lfNoise2M kr 50
        let o = sinOsc kr (n2 * 50 + 50) 0 * 100 + 2000
        return (bpf n1 o 0.001 * 10)
  fmap mce (replicateM 2 insects_m))
