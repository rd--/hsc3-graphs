-- weaklyNonlinear2 ; mouseY controls input strength of forcing oscillator
let input = saw AR 261.626 * mouseY KR 0.0001 1 Exponential 0.1
    freq = mouseX KR 100 400 Linear 0.1
in pan2 (X.weaklyNonlinear2 AR input 0 1 1 freq 0 0 0 0 0 0) 0 0.1
