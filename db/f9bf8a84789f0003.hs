-- playBuf ; check buffer
let b = control kr "buf" 100
    s = bufRateScale kr b
in playBuf 1 ar b s 1 0 NoLoop RemoveSynth * 0.1
