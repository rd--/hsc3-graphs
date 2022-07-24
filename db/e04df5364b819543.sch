-- pmi ; texture=overlap, 1, 2, 7, inf
let pm = Line 0 (Rand 0 12) (Rand 1 12) doNothing
in LinPan2 (PMOsc (Rand 0 2000) (Rand 0 800) pm 0) (Rand2 1) 0.05
