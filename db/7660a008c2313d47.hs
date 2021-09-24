-- resonz ; mouse control (1/Q = bandwidth / center-frequency)
let m = mouseX kr 36 85 Linear 0.2 {- midi note -}
    w = mouseY kr 0.1 5 Linear 0.2 {- bandwidth -}
    f = midiCps (floorE m) {- centre frequency -}
    rq = w / f {- 1/Q (reciprocal of Q) -}
in resonz (pinkNoise ar) f rq
