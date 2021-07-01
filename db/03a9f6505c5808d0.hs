-- svf ; state variable filter
let signal = lfSaw ar (range 110 35 (lfSaw kr 2 0)) 0
    cutoff = mouseX kr 20 20000 Exponential 0.2
    res = mouseY kr 1 0 Linear 0.2
    k = control kr
    low = k "low" 0.1
    band = k "band" 0.0
    high = k "high" 0.0
    notch = k "notch" 0.0
    peak_ = k "peak" 0.0
in X.svf signal cutoff res low band high notch peak_
