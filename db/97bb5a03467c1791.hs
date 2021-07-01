-- gbmanN ; as a frequency control
let f = gbmanN ar 40 1.2 2.1 * 400 + 500
in sinOsc ar f 0 * 0.1
