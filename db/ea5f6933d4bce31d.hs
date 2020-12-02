-- linen ; mouseX is envelope trigger
let x = mouseX KR (-1) 1 Linear 0.1
    y = mouseY KR 0.01 0.25 Linear 0.1
    e = linen x 1 y 1.0 DoNothing
in sinOsc AR 440 0 * e
