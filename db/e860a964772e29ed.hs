-- mutantsounds 05 https://swiki.hfbk-hamburg.de/MusicTechnology/899
let x = mceFillInt 5 (\i -> clip (lfNoise2 i KR 3) 0 1 * 0.03 + 0.00001)
    s = X.friction AR (lfTri AR 50 0) x 0.414 0.313 (x * 30000) 1
in splay s 1 1 0 True
