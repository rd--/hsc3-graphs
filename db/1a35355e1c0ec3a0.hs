-- latoocarfianC ; randomly modulate all parameters
let [n0,n1,n2,n3] = map (\e -> lfNoise2Id e kr 5) ['α','β','γ','δ']
    f = sampleRate / 4
    a = n0 * 1.5 + 1.5
    b = n1 * 1.5 + 1.5
    c = n2 * 0.5 + 1.5
    d = n3 * 0.5 + 1.5
in latoocarfianC ar f a b c d 0.5 0.5 * 0.1
