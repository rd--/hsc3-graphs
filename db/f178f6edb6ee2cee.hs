-- gendy1 ; used as an LFO
let ad = sinOsc kr 0.10 0 * 0.49 + 0.51
    dd = sinOsc kr 0.13 0 * 0.49 + 0.51
    as = sinOsc kr 0.17 0 * 0.49 + 0.51
    ds = sinOsc kr 0.19 0 * 0.49 + 0.51
    g = gendy1Id 'α' kr 2 4 ad dd 3.4 3.5 as ds 10 10
in sinOsc ar (g * 50 + 350) 0 * 0.3
