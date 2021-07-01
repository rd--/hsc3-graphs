-- babbling brook (jmcc) #SC3
let b f m a g _ = let n3 = lpf (brownNoise ar) f * m + a
                      n4 = onePole (brownNoise ar) 0.99
                  in rhpf n4 n3 0.03 * g
    x = mceFill 2 (b 14 400 500 0.006)
    y = mceFill 2 (b 20 800 1000 0.010)
in x + y
