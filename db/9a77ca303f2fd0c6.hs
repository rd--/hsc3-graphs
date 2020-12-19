-- envCoord ; line segments ; internal graph triggers and randomises line end points
let tr = dust 'α' KR 2
    st = 440
    en = tRand 'β' 300 900 tr
    tm = tRand 'γ' 0.5 1.5 tr
    p = envCoord [(0,st),(tm,en)] 1 1 EnvLin
    e = envGen KR tr 1 0 1 DoNothing p
in sinOsc AR e 0 * 0.2
