-- vosim
let trg = impulse AR 100 0
    frq = mouseX KR 440 880 Exponential 0.2
    n_cycles = 3
    dcy = 0.1
in X.vosim AR trg frq n_cycles dcy * 0.25
