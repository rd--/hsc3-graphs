-- linen ; mouseX is envelope trigger
let x = mouseX kr (-1) 1 Linear 0.1
    y = mouseY kr 0.01 0.25 Linear 0.1
    e = linen x 1 y 1.0 DoNothing
in sinOsc ar 440 0 * e
