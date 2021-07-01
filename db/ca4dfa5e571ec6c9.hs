-- in ; audio graph reading control buses 0 & 1 ; control graph writing buses
let wr = out 0 (mce2 (tRandId 'α' 220 2200 (dustId 'β' kr 1)) (dustId 'γ' kr 3))
in mrg2 (sinOsc ar (in' 1 kr 0) 0 * decay (in' 1 kr 1) 0.2 * 0.1) wr
