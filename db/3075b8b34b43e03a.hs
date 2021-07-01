-- mutantsounds 05 https://swiki.hfbk-hamburg.de/MusicTechnology/899
let x = mceFillInt 5 (\i -> clip (lfNoise2Id i kr 3) 0 1 * 0.03 + 0.00001)
    s = X.friction ar (lfTri ar 50 0) x 0.414 0.313 (x * 30000) 1
in splay s 1 1 0 True
