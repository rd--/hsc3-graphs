-- bouncing-objects (jmcc #2)
let f tr =
      let i = Impulse (TXLine (5 + TRand2 2 tr) 600 4 tr) 0 * TXLine 0.09 0.000009 4 tr
          dat = klankDataMce (TRandN 4 400 8400 tr) (TRandN 4 0 1 tr) (TRandN 4 0.01 0.11 tr)
          flt = DynKlank (Decay i 0.001) 1 0 1 dat
          loc = Pan2 flt (TRand2 1 tr) 1
          e = Env [1, 1, 0] [3, 0.001] [1, 1] (-1) (-1)
      in DelayN (loc * EnvGen tr 1 0 1 doNothing e) 1 (TRand 0 1 tr)
in OverlapTexture f 0.001 3 (3.001 / 0.6)
