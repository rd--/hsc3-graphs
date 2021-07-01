-- rlpf ; mouse-control
let x = mouseX kr 2 200 Exponential 0.2
    y = mouseY kr 0.01 1 Exponential 0.2
    ctl = rlpf (saw ar 5 * 0.1) x y
in sinOsc ar (ctl * 200 + 400) 0 * 0.1
