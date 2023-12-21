-- scratchy (jmcc) #1
let n = BrownNoiseN 2 * 0.5
    f = (Max (n - 0.49) 0) * 20
in Rhpf f 5000 1
