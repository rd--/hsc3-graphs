-- recordBuf ; mix second signal equally with existing signal, replay to hear
let b = control kr "buf" 0
    o = formant ar (xLine kr 200 1000 4 DoNothing) 2000 800 * 0.125
in mrg2 o (recordBuf ar b 0 0.5 0.5 1 NoLoop 1 RemoveSynth o)
