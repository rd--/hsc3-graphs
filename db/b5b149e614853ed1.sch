-- birdies (jmcc)
let f tr =
      let p1 = lfpulse (trand 0.4 1.4 tr) 0 (trand 0.1 0.9 tr) * trand 4 7 tr + 2
          p2 = lfpulse (trand 0.4 1.4 tr) 0 (trand 0.1 0.9 tr) * trand 4 7 tr
          p3 = lfpulse (trand 0.2 0.7 tr) 0 0.4 * 0.02
          sw = lfsaw (p1 + p2) 0 * neg (trand 1000 1800 tr) + 4000 + trand2 1200 tr
      in pan2 (sinosc (lag sw 0.05) 0 * lag p3 0.3) (trand2 1 tr) 1
in overlaptexture 7 4 4 f
