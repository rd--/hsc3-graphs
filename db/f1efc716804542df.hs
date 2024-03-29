-- poll ; at trigger control
let t = trigControl "t" 0.3
    f1 = lfNoise2Id 'α' ar 0.25 * 100 + 110
    f2 = lfNoise2Id 'β' ar 0.25 * 200 + 220
    s = gendy1Id 'γ' ar 1 1 1 1 f1 f2 0.5 0.5 12 0 * 0.1
    p = poll t (mce2 f1 f2) (-1) (mce2 (label "f1") (label "f2"))
in mrg2 s p
