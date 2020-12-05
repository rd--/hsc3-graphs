-- discretion (rd, 2006-10-15)
let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
    part = let f1 = X.randN 2 'α' 50 55
               f2 = X.randN 2 'β' 50 65
               f3 = X.randN 2 'γ' 50 55
               a = X.randN 2 'δ' 0.01 0.035
               t = 21
               f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
               a_ = mkls [(0,0),(0.33,a),(1,0)] t
           in (saw AR f_ * a_)
in mix (Protect.uclone_all 'ε' 8 part)
