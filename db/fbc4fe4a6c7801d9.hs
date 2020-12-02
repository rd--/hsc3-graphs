-- sinOsc ; mouse control
let x = mouseX KR 40 10000 Exponential 0.2
    y = mouseY KR 0.01 0.25 Exponential 0.2
in sinOsc AR x 0 * y
