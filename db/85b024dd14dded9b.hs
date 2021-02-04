-- resonz ; mouse control (1/Q = bandwidth / center-frequency)
let n = pinkNoise 'α' AR
    m = mouseX KR 36 85 Linear 0.2 {- midi note -}
    w = mouseY KR 0.1 5 Linear 0.2 {- bandwidth -}
    f = midiCPS (floorE m) {- centre frequency -}
    rq = w / f {- 1/Q (reciprocal of Q) -}
in resonz (n * 0.5) f rq
