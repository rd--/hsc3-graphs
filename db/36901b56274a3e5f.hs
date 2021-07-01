-- mul ; gate ; control
let freq = control_m kr "freq" 220 (55,880,"exp")
    amp = control_m kr "amp" 0.1 (0,1,"amp")
    gate_ = control_m kr "gate" 0 (0,1,"switch")
in sinOsc ar freq 0 * amp * lag gate_ 0.1
