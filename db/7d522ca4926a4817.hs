-- redPhasor ; mouse x controls loop rate, mouse y scales the start loop-point
let x = mouseX KR 0 5 Linear 0.2
    y = mouseY KR 200 500 Linear 0.2
in sinOsc AR (X.redPhasor KR 0 x 400 800 1 y 600) 0 * 0.2
