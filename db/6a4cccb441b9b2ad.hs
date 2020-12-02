-- gendy1 ; used as an LFO
let ad = sinOsc KR 0.10 0 * 0.49 + 0.51
    dd = sinOsc KR 0.13 0 * 0.49 + 0.51
    as = sinOsc KR 0.17 0 * 0.49 + 0.51
    ds = sinOsc KR 0.19 0 * 0.49 + 0.51
    g = gendy1 'α' KR 2 4 ad dd 3.4 3.5 as ds 10 10
in sinOsc AR (g * 50 + 350) 0 * 0.3
