-- eggcrate (rd, 2007-04-23) ; monad
uid_st_eval (do
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
      clone2 x = x >>= \y1 -> x >>= \y2 -> return (y1,y2)
  (x,y) <- clone2 (brownNoiseM kr)
  t <- dustM kr 2.4
  (f0,f1) <- clone2 (tChooseM t p)
  let f = linLin_b (eggcrate_f x y) f0 f1
      a = linLin_b x 0 0.1
  return (pan2 (mix (sinOsc ar f 0)) y a))
