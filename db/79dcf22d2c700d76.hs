-- weaklyNonlinear2 ; duffing equation
let input = sinOsc AR (mouseX KR 1 1000 Exponential 0.1) 0 * 0.1
    freq = mouseY KR 1 1000 Exponential 0.1
in pan2 (X.weaklyNonlinear2 AR input 0 1 1 freq 0 0 (-0.001) 3 0 0) 0 0.1
