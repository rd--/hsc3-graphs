-- clustered sines (jmcc) #2 ; texture=xfade,4,4,inf
let cs _ =
      let n = 80
          f1 = rand 100 1100
          f2 = 4 * f1
          sp = let y = mceFill n (\_ -> f1 + rand 0 f2)
               in klangSpec_mce y (mceMap (f1 /) y) (mceFill n (const 0))
      in klang ar 1 0 sp * (0.3 / fromIntegral n)
in mceFill 2 cs
