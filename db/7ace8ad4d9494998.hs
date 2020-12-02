-- balance2
let s0 = sinOsc AR 440 0
    s1 = sinOsc AR 550 0
    x = mouseX KR (-1) 1 Linear 0.2
in balance2 s0 s1 x 0.2
