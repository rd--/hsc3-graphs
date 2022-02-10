-- discretion (rd, 2006-10-15)
let mkls bp t = envGen kr 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
    part _ = let t = 21
                 f = mkls [(0,X.randN 2 50 55),(0.33,X.randN 2 50 65),(1,X.randN 2 50 55)] t
                 a = mkls [(0,0),(0.33,X.randN 2 0.01 0.035),(1,0)] t
             in (saw ar f * a)
in mixFill 8 part
