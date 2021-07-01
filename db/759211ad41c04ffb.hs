-- redPhasor ; start value greater than end value, positive rate, c.f. redPhasor2
let tr = mouseX kr 0 1 Linear 0.2 `greater_than` 0.5
in sinOsc ar (X.redPhasor kr tr 0.3 800 400 0 500 600) 0 * 0.2
