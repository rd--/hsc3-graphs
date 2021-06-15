-- bouncing-objects (jmcc #2)
let f tr =
      let i = impulse (txline (5 + trand2 2 tr) 600 4 tr) 0 * txline 0.09 0.000009 4 tr
          dat = klankdatamce (rtrandn 4 400 8400 tr) (rtrandn 4 0 1 tr) (rtrandn 4 0.01 0.11 tr)
          flt = dynklank (decay i 0.001) 1 0 1 dat
          loc = pan2 flt (trand2 1 tr) 1
          e = env [1,1,0] [3,0.001] [1,1] (-1) (-1)
      in delayn (loc * envgen tr 1 0 1 donothing e) 1 (trand 0 1 tr)
in overlaptexture 0.001 3 (3.001 / 0.6) f
