-- rdx7 ; data at shared buffer ; external control
let buf = control KR "dat" 100
    gate_ = control KR "gate" 0
    reset = control KR "reset" 0
    data_ = control KR "data" 0
    vc = control KR "vc" 0
    mnn = control KR "mnn" 60
    vel = control KR "vel" 99
    pw = 0x2000
    mw = 0
    bc = 0
    fc = 0
in X.rdx7 AR buf gate_ reset data_ vc mnn vel pw mw bc fc
