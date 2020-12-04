-- playBufCF ; wslib ; CF = cross-fade ; control-rate trigger and start-position inputs
let b = control KR "buf" 0
    r = bufRateScale KR b
    tr = impulse KR 2 0
    wn = whiteNoise 'α' KR
    sp = linLin wn (-1) 1 0 (bufFrames KR b - (0.5 * 44100))
    o = playBufCF 1 b r tr sp NoLoop 0.1 2
    o' = playBuf 1 AR b r tr sp NoLoop DoNothing
in mce2 o o'
