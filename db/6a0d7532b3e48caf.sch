-- scratchy (jmcc) #1
let n = mceFill 2 (\_ -> BrownNoise ()) * 0.5
    f = (Max (n - 0.49) 0) * 20
in RHPF f 5000 1
