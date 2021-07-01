-- dstutter
let inp = dseqId 'α' dinf (mce [1,2,3])
    nse = diwhiteId 'β' dinf 2 8
    rep = dstutterId 'γ' nse inp
    trg = impulse kr (mouseX kr 1 40 Exponential 0.2) 0
    frq = demand trg 0 rep * 30 + 340
in sinOsc ar frq 0 * 0.1
