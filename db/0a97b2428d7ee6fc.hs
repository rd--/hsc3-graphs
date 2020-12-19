-- envCoord ; line segments ; external control
let tr = tr_control "tr" 1
    st = control KR "st" 440
    en = control KR "en" 880
    tm = control KR "tm" 2
    p = envCoord [(0,st),(tm,en)] 1 1 EnvLin
    e = envGen KR tr 1 0 1 DoNothing p
in sinOsc AR e 0 * 0.2
