-- blips 001 (jmcc) #SC3d1.5 ; texture=overlap,2,1,12,inf
let mk _ =
      let f = xLine kr (expRand 0.25 400) (expRand 0.25 400) 4 DoNothing
          nh = xLine kr (expRand 2 100) (expRand 2 100) 4 DoNothing
      in blip ar f nh
    pp = iter 6 (\x -> allpassN x 0.05 (mce2 (rand 0 0.05) (rand 0 0.05)) 4) . distort
in pp (rand 0 1 <** 0.8 * pan2 (mk () * mk ()) (line kr (rand2 1) (rand2 1) 4 DoNothing) 0.3)
