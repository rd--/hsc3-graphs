-- grainBuf ; requires=buf
let buf = control KR "buf" 0
    dur = 15
    lin a b = line KR a b dur RemoveSynth
    tr = impulse KR (lin 7.5 15) 0
    gd = lin 0.05 0.1
    r = lin 1 0.5 {- rate -}
    i = lin 0 1 {- read-location -}
    l = lin (-0.5) 0.5 {- stereo-location -}
in grainBuf 2 tr gd buf r i 2 l (-1) 512 * 0.25
