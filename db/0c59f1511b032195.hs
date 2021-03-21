-- rongs
let tr_freq = sinOsc KR 0.1 (pi/2) `in_exprange` (10.1,1.0)
    tr = dust2 'α' KR tr_freq
    sig = let f0 = mce2 1.0 1.01 * tRand 'β' 0.001 0.100 tr
              structure = tRand 'γ' 0.25 0.75 tr
              brightness = tRand 'δ' 0.25 0.75 tr
              damping = tRand 'ζ' 0.15 0.65 tr
              accent = 0.9
              stretch = tRand 'ε' 0.1 0.99 tr
              position = 0.15
              loss = tRand 'η' 0.1 0.5 tr
          in X.rongs AR tr tr f0 structure brightness damping accent stretch position loss
in splay (leakDC sig 0.995) 0.25 1 (tRand 'θ' (-1) 1 tr) True
