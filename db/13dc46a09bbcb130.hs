-- envCoord ; line segments ; internal graph triggers and randomises line end points
let tr = dustId 'α' kr 2
    st = 440
    en = tRandId 'β' 300 900 tr
    tm = tRandId 'γ' 0.5 1.5 tr
    p = envCoord [(0,st),(tm,en)] 1 1 EnvLin
    e = envGen kr tr 1 0 1 DoNothing p
in sinOsc ar e 0 * 0.2
