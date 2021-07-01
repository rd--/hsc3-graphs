-- sinOsc ; mouse control
let x = mouseX kr 40 10000 Exponential 0.2
    y = mouseY kr 0.01 0.25 Exponential 0.2
in sinOsc ar x 0 * y
