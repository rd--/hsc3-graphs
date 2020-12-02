-- balance2
let s = sinOsc AR 440 0
    p = sinOsc KR 0.2 0
in balance2 s s p 1 * 0.2
