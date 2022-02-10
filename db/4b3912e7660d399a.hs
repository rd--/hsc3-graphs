-- discretion (rd, 2006-10-15) ; id
let mkls bp t = envGen kr 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
    part z _ = let f1 = X.randNId 2 (z,'α') 50 55
                   f2 = X.randNId 2 (z,'β') 50 65
                   f3 = X.randNId 2 (z,'γ') 50 55
                   a = X.randNId 2 (z,'δ') 0.01 0.035
                   t = 21
                   f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
                   a_ = mkls [(0,0),(0.33,a),(1,0)] t
               in (saw ar f_ * a_)
in mixFillId 'ε' 8 part
