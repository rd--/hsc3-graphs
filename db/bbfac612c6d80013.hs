-- dbufrd ; pattern as frequency input
let n = System.Random.randomRs (200.0,500.0) (System.Random.mkStdGen 0)
    b = asLocalBuf 'α' (take 24 n)
    s = dseq 'β' 3 (mce [0,3,5,0,3,7,0,5,9])
    p = dseq 'γ' dinf (mce [s,dbrown 'δ' 5 0 23 1])
    t = dust 'ε' KR 10
    r = dbufrd 'ζ' b p Loop
in sinOsc AR (demand t 0 r) 0 * 0.1
