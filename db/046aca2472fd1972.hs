-- grainBuf ; requires=buf
let (buf, nc) = (control kr "buf" 100, 2)
    dur = 15
    lin a b = line kr a b dur RemoveSynth
    tr = impulse kr (lin 7.5 15) 0
    gd = lin 0.05 0.1
    r = lin 1 0.5 {- rate -}
    i = lin 0 1 {- read-location -}
    l = lin (-0.5) 0.5 {- stereo-location -}
in grainBuf nc tr gd buf r i 2 l (-1) 512 * control kr "gain" 0.25
