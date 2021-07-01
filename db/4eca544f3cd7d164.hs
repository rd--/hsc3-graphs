-- circleRamp ; fast x-axis movements from edges will wrap outside (no discontinuity)
let x = mouseX kr 0 2 Linear 0.2
    c = X.circleRamp kr x 0.1 (-1) 1
in pan2 (sinOsc ar 440 0) c 0.1
