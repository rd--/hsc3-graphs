-- svf
let signal = lfSaw AR (range 110 35 (lfSaw KR 2 0)) 0
    cutoff = mouseX KR 20 20000 Exponential 0.2
    res = mouseY KR 1 0 Linear 0.2
    k = control KR
    low = k "low" 0.1
    band = k "band" 0.0
    high = k "high" 0.0
    notch = k "notch" 0.0
    peak_ = k "peak" 0.0
in X.svf signal cutoff res low band high notch peak_
