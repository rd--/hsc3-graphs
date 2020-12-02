-- doubleWell3 ; bass synth
let x = mouseX KR 0 200 Linear 0.2
    y = mouseY KR 0.5 4.0 Linear 0.2
    f = sinOsc AR x 0 * y
in X.doubleWell3 AR 0 0.01 f 0.25 0 0
