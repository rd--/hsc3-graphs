-- mce ; channel layout is L=440,441 and R=660,661
let f = mce2 (mce2 440 660) (mce2 441 661)
in mix (sinOsc ar f 0 * 0.1)
