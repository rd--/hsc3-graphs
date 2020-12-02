-- playBuf ; check buffer
let b = control KR "buf" 0
    s = bufRateScale KR b
in playBuf 1 AR b s 1 0 NoLoop RemoveSynth * 0.1
