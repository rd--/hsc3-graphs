-- lpg
let tempo = 8
    envdur = 0.91
    tr = impulse KR tempo 0
    squ = demand tr 0 (dseq 'α' dinf (mce [200,291,420,191,320])) `lag` 0.01
    mdl = tWChoose 'β' tr (mce [0.5,1.0,1.5]) (mce [0.75, 0.125, 0.125]) 0
    sig = sinOscFB AR (squ * mdl) 1.1 + whiteNoise 'γ' AR * 0.1
    rnd = tRand 'δ' 0 1 tr
    env = envGen KR tr 1 0 (envdur / tempo) DoNothing (envPerc rnd (1 - rnd))
    flt = let c_off = lfSaw KR 0.1 0 `in_range` (0,0.2)
              c_mul = lfNoise2 'ε' KR 0.1 `in_range` (0.4,0.95)
              vca = lfNoise2 'ζ' KR 1 `in_range` (0,1)
          in X.lpg sig env c_off c_mul vca 1.1 1 0
in pan2 flt (0.5 * tRand 'η' (-1) 1 tr) 0.25
