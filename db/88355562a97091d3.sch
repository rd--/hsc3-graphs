-- pmi ; texture graph
let f tr =
      let pm = tline 0 (trand 0 12 tr) (trand 1 12 tr) tr
      in linpan2 (pmosc (trand 0 2000 tr) (trand 0 800 tr) pm 0) (trand2 1 tr) 0.05
in overlaptexture 1 2 7 f
