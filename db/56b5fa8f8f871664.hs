-- circleRamp ; editing lagTime to alter path taken
let p = lfPulse KR (line KR 20 0.1 10 DoNothing) 0 0.75 + 0.25
    c = X.circleRamp KR p (mouseX KR 0.01 0.1 Linear 0.1) (-1) 1
in pan2 (sinOsc AR 440 0) c 0.1
