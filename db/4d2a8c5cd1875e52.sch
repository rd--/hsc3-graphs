-- alien meadow (jmcc) #6
let f tr =
      let freq = sinosc (trand 0 20 tr) 0 * trand 0 5000 tr * 0.1 + trand 0 5000 tr
      in pan2 (sinosc freq 0) (trand2 1 tr) (sinosc (trand 0 20 tr) 0 * 0.05 + 0.05)
in overlaptexture 2 6 6 f
