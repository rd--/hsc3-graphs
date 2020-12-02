-- linExp ; the destination range may be k-rate
let x = mouseX KR 0 1 Linear 0.2
    y = mouseY KR 220 440 Linear 0.2
    f = linExp x 0 1 y 660
in sinOsc AR f 0 * 0.1
