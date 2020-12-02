-- rlpf ; mouse-control
let x = mouseX KR 2 200 Exponential 0.2
    y = mouseY KR 0.01 1 Exponential 0.2
    ctl = rlpf (saw AR 5 * 0.1) x y
in sinOsc AR (ctl * 200 + 400) 0 * 0.1
