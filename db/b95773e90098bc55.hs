-- lorenzL ; frequency control
let x = mouseX kr 1 200 Linear 0.1
    n = lorenzL ar x 10 28 2.667 0.05 0.1 0 0
in sinOsc ar (lag n 0.003 * 800 + 900) 0 * 0.4
