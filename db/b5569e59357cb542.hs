-- mul ; gate ; control
let freq = control_m KR "freq" 220 (55,880,"exp")
    amp = control_m KR "amp" 0.1 (0,1,"amp")
    gate_ = control_m KR "gate" 0 (0,1,"switch")
in sinOsc AR freq 0 * amp * lag gate_ 0.1
