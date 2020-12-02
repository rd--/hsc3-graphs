-- in ; audio graph reading control buses 0 & 1 ; control graph writing buses
let wr = out 0 (mce2 (tRand 'α' 220 2200 (dust 'β' KR 1)) (dust 'γ' KR 3))
in mrg2 (sinOsc AR (in' 1 KR 0) 0 * decay (in' 1 KR 1) 0.2 * 0.1) wr
