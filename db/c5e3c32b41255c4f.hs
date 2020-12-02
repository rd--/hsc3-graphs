-- rdx7Env
let gate_ = control KR "gate" 0
    data_ = control KR "data" 0
    [r1,r2,r3,r4] = map (\k -> control KR ('r':show k) 99) [1 .. 4]
    [l1,l2,l3,l4] = map (\(k,v) -> control KR ('l':show k) v) (zip [1 .. 4] [99,99,99,00])
    ol = control KR "ol" 99
in sinOsc AR 440 0 * X.rdx7Env AR gate_ data_ r1 r2 r3 r4 l1 l2 l3 l4 ol
