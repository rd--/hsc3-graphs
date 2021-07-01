-- weaklyNonlinear2 ; duffing equation
let input = sinOsc ar (mouseX kr 1 1000 Exponential 0.1) 0 * 0.1
    freq = mouseY kr 1 1000 Exponential 0.1
in pan2 (X.weaklyNonlinear2 ar input 0 1 1 freq 0 0 (-0.001) 3 0 0) 0 0.1
