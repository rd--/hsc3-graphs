-- balance2
let s = sinOsc ar 440 0
    p = sinOsc kr 0.2 0
in balance2 s s p 1 * 0.2
