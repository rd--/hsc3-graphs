-- scratchy (jmcc) #1
let n = mceFill 2 (\_ -> brownNoise ar * 0.5 - 0.49)
in rhpf (max n 0 * 20) 5000 1
