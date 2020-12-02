-- lfTri ; c.f. dpw3Tri efficiency
let f = X.randN 50 'α' 50 5000
in splay (lfTri AR f 0) 1 0.1 0 True
