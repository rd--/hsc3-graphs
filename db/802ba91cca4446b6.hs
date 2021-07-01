-- balance2
let s0 = sinOsc ar 440 0
    s1 = sinOsc ar 550 0
    x = mouseX kr (-1) 1 Linear 0.2
in balance2 s0 s1 x 0.2
