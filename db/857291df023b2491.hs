-- weaklyNonlinear2 ; mouseY controls input strength of forcing oscillator
let input = saw ar 261.626 * mouseY kr 0.0001 1 Exponential 0.1
    freq = mouseX kr 100 400 Linear 0.1
in pan2 (X.weaklyNonlinear2 ar input 0 1 1 freq 0 0 0 0 0 0) 0 0.1
