-- redPhasor2 ; no looping & it will play through once ; mouse x acts as trigger
let tr = mouseX kr 0 1 Linear 0.2 `greater_than` 0.5
in sinOsc ar (X.redPhasor2 kr tr 0.3 400 800 0 500 600) 0 * 0.2
