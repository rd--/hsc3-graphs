-- leakDC
let a = lfPulse ar 800 0 0.5 * 0.1 + 0.5
in mce [a,leakDC a 0.995]
