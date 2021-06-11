-- pmi ; texture=overlap,1,2,7,inf
let pm = line 0 (rand 0 12) (rand 1 12) donothing
in linpan2 (pmosc (rand 0 2000) (rand 0 800) pm 0) (rand2 1) 0.05
