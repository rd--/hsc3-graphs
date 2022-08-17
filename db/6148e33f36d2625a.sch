-- pmi ; texture graph
let f tr =
      let pm = TLine 0 (TRand 0 12 tr) (TRand 1 12 tr) tr
      in LinPan2 (PMOsc (TRand 0 2000 tr) (TRand 0 800 tr) pm 0) (TRand2 1 tr) 0.05
in OverlapTexture f 1 2 7
