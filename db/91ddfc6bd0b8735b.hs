-- theremin (jmcc) ; mouse control
let m = 7
    detune = 0
    x = mouseX kr 0 0.6 Linear 0.2
    y = mouseY kr 4000 200 Exponential 0.8
    f = y + detune
    f' = f + f * sinOsc ar m 0 * 0.02
    a = sinOsc ar f' 0 * x
in pan2 a 0 1
