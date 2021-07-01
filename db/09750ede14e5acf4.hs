-- dbufrd ; pattern as frequency input
let n = System.Random.randomRs (200.0,500.0) (System.Random.mkStdGen 0)
    b = asLocalBufId 'α' (take 24 n)
    s = dseqId 'β' 3 (mce [0,3,5,0,3,7,0,5,9])
    p = dseqId 'γ' dinf (mce [s,dbrownId 'δ' 5 0 23 1])
    t = dustId 'ε' kr 10
    r = dbufrdId 'ζ' b p Loop
in sinOsc ar (demand t 0 r) 0 * 0.1
