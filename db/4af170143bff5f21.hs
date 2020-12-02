-- dstutter
let inp = dseq 'α' dinf (mce [1,2,3])
    nse = diwhite 'β' dinf 2 8
    rep = dstutter 'γ' nse inp
    trg = impulse KR (mouseX KR 1 40 Exponential 0.2) 0
    frq = demand trg 0 rep * 30 + 340
in sinOsc AR frq 0 * 0.1
