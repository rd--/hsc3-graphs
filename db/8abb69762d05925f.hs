-- rdx7Env
let gate_ = control kr "gate" 0
    data_ = control kr "data" 0
    [r1,r2,r3,r4] = map (\k -> control kr ('r':show k) 99) [1 .. 4]
    [l1,l2,l3,l4] = map (\(k,v) -> control kr ('l':show k) v) (zip [1 .. 4] [99,99,99,00])
    ol = control kr "ol" 99
in sinOsc ar 440 0 * X.rdx7Env ar gate_ data_ r1 r2 r3 r4 l1 l2 l3 l4 ol
