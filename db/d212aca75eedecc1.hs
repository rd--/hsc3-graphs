-- linExp ; the destination range may be k-rate
let x = mouseX kr 0 1 Linear 0.2
    y = mouseY kr 220 440 Linear 0.2
    f = linExp x 0 1 y 660
in sinOsc ar f 0 * 0.1
