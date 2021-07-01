-- hasher ; remap x
let x = mouseX kr 0 10 Linear 0.2
    f = hasher (roundTo x 1) * 300 + 500
in sinOsc ar f 0 * 0.1
