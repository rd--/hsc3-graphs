-- analogTape
let freq = control kr "freq" 110
    width = control kr "width" 0.5
    bias = control kr "bias" 0.5
    saturation = control kr "saturation" 0.5
    drive = control kr "drive" 0.5
    sig = varSaw ar freq 0 width
in mce2 (sig * 0.05) (X.analogTape sig bias saturation drive 1 0 * 0.1)
