-- grainFM
let d = 15
    lin a b = line kr a b d RemoveSynth
    l = lin (-0.5) 0.5
    f = lin 200 800
    t = impulse kr (lin 7.5 15) 0
    i = lin (-1) 1
in grainFM 2 t 0.1 f 200 i l (-1) 512 * 0.1
