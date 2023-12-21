-- playBufCF ; wslib ; CF = cross-fade ; control-rate trigger and start-position inputs
let b = control kr "buf" 100
    r = bufRateScale kr b
    tr = impulse kr 2 0
    wn = whiteNoiseId 'α' kr
    sp = linLin wn (-1) 1 0 (bufFrames kr b - (0.5 * 44100))
    o = playBufCF 1 b r tr sp NoLoop 0.1 2
    o' = playBuf 1 ar b r tr sp NoLoop DoNothing
in mce2 o o'
