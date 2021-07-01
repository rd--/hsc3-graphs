-- ; jPverbRaw ; dreamverb ; controls
let k = control kr
    (i1,i2) = (soundIn 0,soundIn 1)
    rvb = X.jPverbRaw i1 i2 (k "damp" 0.314) (k "earlydiff" 0.421) (k "highband" 1024.02) (k "highx" 0.0) (k "lowband" 2450.08) (k "lowx" 0.844) (k "mdepth" 4.639) (k "mfreq" 0.103) (k "midx" 0.706) (k "size" 2.794) (k "t60" 60)
in mce2 i1 i2 + rvb
