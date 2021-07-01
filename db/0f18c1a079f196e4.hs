-- tDuty ; amplitude changes
let d0 = dseqId 'α' dinf (mce [0.1, 0.2, 0.4, 0.3])
    d1 = dseqId 'β' dinf (mce [0.1, 0.4, 0.01, 0.5, 1.0])
in ringz (tDuty ar d0 0 DoNothing d1 1) 1000 0.1
