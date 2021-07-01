-- tDuty ; mouse control
let d = dseqId 'α' dinf (mce [0.1, 0.4, 0.01, 0.5, 1.0])
    x = mouseX kr 0.003 1 Exponential 0.1
in ringz (tDuty ar x 0 DoNothing d 1) 1000 0.1 * 0.5
