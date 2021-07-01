-- envCoord ; line segments ; external control
let tr = trigControl "tr" 1
    st = control kr "st" 440
    en = control kr "en" 880
    tm = control kr "tm" 2
    p = envCoord [(0,st),(tm,en)] 1 1 EnvLin
    e = envGen kr tr 1 0 1 DoNothing p
in sinOsc ar e 0 * 0.2
