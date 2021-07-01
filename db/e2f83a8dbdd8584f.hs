-- recordBuf ; mce
let b = mce2 (control kr "buf1" 0) (control kr "buf2" 0)
    o = sinOsc ar (mce2 110 220) 0 * 0.1
in mrg2 o (recordBuf ar b 0 0.5 0.5 1 NoLoop 1 RemoveSynth (mce1 o))
