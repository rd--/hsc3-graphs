-- lorenzTrig ; as a frequency control
let x0 = 0.090879182417163
    y0 = 2.97077458055
    z0 = 24.282041054363
    n = X.lorenzTrig AR 1 8 10 28 28 0.02 x0 y0 z0
in sinOsc AR (decay n 1.0 * 800 + 900) 0 * 0.2
