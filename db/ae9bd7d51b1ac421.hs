-- redPhasor ; mouse x controls loop rate, mouse y scales the start loop-point
let x = mouseX kr 0 5 Linear 0.2
    y = mouseY kr 200 500 Linear 0.2
in sinOsc ar (X.redPhasor kr 0 x 400 800 1 y 600) 0 * 0.2
