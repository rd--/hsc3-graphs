-- redPhasor ; mouse y controls looping on/off, mouse x trigger
let tr = mouseX kr 0 1 Linear 0.2 `greater_than` 0.5
    lp = mouseY kr 0 1 Linear 0.2 `greater_than` 0.5
in sinOsc ar (X.redPhasor kr tr 0.3 400 800 lp 500 600) 0 * 0.2
