-- in ; make a control rate graph to write freq and gate values
let wr = out 10 (mce2 (tRandId 'α' 220 2200 (dustId 'β' kr 1)) (dustId 'γ' kr 3))
    rd = sinOsc ar (in' 1 kr 10) 0 * decay2 (in' 1 kr 11) 0.01 1 * 0.25
in mrg2 rd wr
