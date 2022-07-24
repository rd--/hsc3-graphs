-- alien meadow (jmcc) #6
let f tr =
      let freq = SinOsc (TRand 0 20 tr) 0 * TRand 0 5000 tr * 0.1 + TRand 0 5000 tr
      in Pan2 (SinOsc freq 0) (TRand2 1 tr) (SinOsc (TRand 0 20 tr) 0 * 0.05 + 0.05)
in OverlapTexture 2 6 6 f
