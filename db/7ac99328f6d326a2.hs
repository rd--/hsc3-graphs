-- jPverbRaw ; dreamverb
let (i1,i2) = (soundIn 0,soundIn 1)
    rvb = X.jPverbRaw i1 i2 0.314 0.421 1024.0219 0.0 2450.082 0.843 4.639 0.103 0.706 2.793 60.0
in mce2 i1 i2 + rvb
