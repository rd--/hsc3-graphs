-- dpw3Tri ; less efficient than LFTri
let f = X.rRandN 50 'α' 50 5000
in splay (X.dpw3Tri AR f) 1 0.1 0 True
