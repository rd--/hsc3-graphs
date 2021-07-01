-- rFreezer ; controls
let b = control_m kr "buf" 0 (0,0,"lin")
    (lhs,rhs) = control_rng kr "wnd" (0,1) (0,1,"lin")
    amp = control_m kr "amp" 0.1 (0,1,"amp")
    incr = control_m kr "incr" 1 (0,4,"lin")
    incrO = control_m kr "incrO" 0 (0,1,"lin")
    incrR = control_m kr "incrR" 0 (0,1,"lin")
    wndR = control_m kr "wndR" 0 (0,1,"lin")
    syncPh = control_m kr "syncPh" 0 (0,1,"trigger")
    randPh = control_m kr "randPh" 0 (0,1,"trigger")
    dgr = control_m kr "numLp" 24 (1,64,"lin")
in X.rFreezer b lhs rhs amp incr incrO incrR wndR syncPh randPh dgr
