-- hypot
let x = mouseX KR 0 0.1 Linear 0.1
    y = mouseY KR 0 0.1 Linear 0.1
in sinOsc AR 440 0 * hypot x y
