-- dx7 ; data at shared buffer ; external control
let buf = control kr "dat" 100
    gate_ = control kr "gate" 0
    reset = control kr "reset" 0
    data_ = control kr "data" 0
    vc = control kr "vc" 0
    mnn = control kr "mnn" 60
    vel = control kr "vel" 99
    pw = 0x2000
    mw = 0
    bc = 0
    fc = 0
in X.dx7 ar buf gate_ reset data_ vc mnn vel pw mw bc fc
