-- recordBuf ; mce
let b = control kr "buf" 0
    o = sinOsc ar (mce2 110 220) 0 * 0.1
in mrg2 o (recordBuf ar (mce2 b b) 0 0.5 0.5 1 NoLoop 1 RemoveSynth (mce1 o))
