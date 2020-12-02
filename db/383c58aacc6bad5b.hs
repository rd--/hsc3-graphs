-- cuspL ; frequency control
let x = mouseX KR 0.9 1.1 Linear 0.1
    y = mouseY KR 1.8 2.0 Linear 0.1
    n = cuspL AR 40 x y 0 * 0.3
in sinOsc AR (n * 800 + 900) 0 * 0.1
