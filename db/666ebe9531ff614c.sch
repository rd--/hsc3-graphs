-- scratchy (jmcc) #1
let n = mceFill 2 (\_ -> brownnoise ()) * 0.5
    f = (max (n - 0.49) 0) * 20
in rhpf f 5000 1
