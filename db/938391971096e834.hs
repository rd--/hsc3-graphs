-- dshuf
let a = dseq 'α' dinf (dshuf 'β' 5 (X.rRandN 81 'γ' 0 10))
    x = mouseX KR 1 10000 Exponential 0.1
    t = impulse AR x 0
    f = demand t 0 a * 30 + 340
in sinOsc AR f 0 * 0.1
