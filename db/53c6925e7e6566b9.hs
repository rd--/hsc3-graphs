-- changed ; sinOsc is constantly changing
let s = sinOsc ar 440 0
    c = changed s 0
in s * c * 0.2
