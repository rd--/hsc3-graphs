-- changed ; sinOsc is constantly changing
let s = sinOsc AR 440 0
    c = changed s 0
in s * c * 0.2
