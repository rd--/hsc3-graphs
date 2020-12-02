-- henonN ; as a frequency control
let x = mouseX KR 1 1.4 Linear 0.1
    y = mouseY KR 0 0.3 Linear 0.1
    f0 = 40
    f = henonN AR f0 x y 0 0 * 800 + 900
in sinOsc AR f 0 * 0.4
