-- redPhasor ; mouse y controls looping on/off, mouse x trigger
let tr = mouseX KR 0 1 Linear 0.2 `greater_than` 0.5
    lp = mouseY KR 0 1 Linear 0.2 `greater_than` 0.5
in sinOsc AR (X.redPhasor KR tr 0.3 400 800 lp 500 600) 0 * 0.2
