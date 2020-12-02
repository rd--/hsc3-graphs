-- tDuty ; mouse control
let d = dseq 'α' dinf (mce [0.1, 0.4, 0.01, 0.5, 1.0])
    x = mouseX KR 0.003 1 Exponential 0.1
in ringz (tDuty AR x 0 DoNothing d 1) 1000 0.1 * 0.5
