-- henonN ; as a frequency control
let x = mouseX kr 1 1.4 Linear 0.1
    y = mouseY kr 0 0.3 Linear 0.1
    f0 = 40
    f = henonN ar f0 x y 0 0 * 800 + 900
in sinOsc ar f 0 * 0.4
