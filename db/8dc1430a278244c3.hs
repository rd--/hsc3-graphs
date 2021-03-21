-- weaklyNonlinear2 ; van der Pol equation
let input = sinOsc AR (mouseX KR 10 2000 Linear 0.1) 0 * 0.1
    reset = impulse KR (mouseY KR 0 100 Linear 0.1) 0
in pan2 (X.weaklyNonlinear2 AR input reset 1 1 440 0 0 (-0.01) 2 (-1) 1) 0 0.1
