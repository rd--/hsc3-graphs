-- rFreezer ; controls
let b = control_m KR "buf" 0 (0,0,"lin")
    (lhs,rhs) = control_rng KR "wnd" (0,1) (0,1,"lin")
    amp = control_m KR "amp" 0.1 (0,1,"amp")
    incr = control_m KR "incr" 1 (0,4,"lin")
    incrO = control_m KR "incrO" 0 (0,1,"lin")
    incrR = control_m KR "incrR" 0 (0,1,"lin")
    wndR = control_m KR "wndR" 0 (0,1,"lin")
    syncPh = control_m KR "syncPh" 0 (0,1,"trigger")
    randPh = control_m KR "randPh" 0 (0,1,"trigger")
    dgr = control_m KR "numLp" 24 (1,64,"lin")
in X.rFreezer b lhs rhs amp incr incrO incrR wndR syncPh randPh dgr
