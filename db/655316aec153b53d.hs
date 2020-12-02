-- hasher ; remap x
let x = mouseX KR 0 10 Linear 0.2
    f = hasher (roundTo x 1) * 300 + 500
in sinOsc AR f 0 * 0.1
