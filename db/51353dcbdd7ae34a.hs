-- linCongC ; randomly modulate parameters
let fr = [1,0.1,0.1,0.1]
    [n0,n1,n2,m] = map (\(i,j) -> lfNoise2Id i kr j) (zip ['α'..] fr)
    f = n0 * 1e4 + 1e4
    a = n1 * 0.5 + 1.4
    c = n2 * 0.1 + 0.1
in linCongC ar f a c m 0 * 0.1
