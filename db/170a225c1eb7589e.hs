-- gbmanN ; as a frequency control
let f = gbmanN AR 40 1.2 2.1 * 400 + 500
in sinOsc AR f 0 * 0.1
