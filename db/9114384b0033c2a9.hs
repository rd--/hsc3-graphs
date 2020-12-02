-- roundUp
let x = mouseX KR 60 4000 Linear 0.1
    f = roundUp x 100
in sinOsc AR f 0 * 0.1
