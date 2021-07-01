-- vosim
let trg = impulse ar 100 0
    frq = mouseX kr 440 880 Exponential 0.2
    n_cycles = 3
    dcy = 0.1
in X.vosim ar trg frq n_cycles dcy * 0.25
