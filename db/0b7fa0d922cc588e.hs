-- lpg
let tempo = 8
    envdur = 0.91
    tr = impulse kr tempo 0
    squ = demand tr 0 (dseqId 'α' dinf (mce [200,291,420,191,320])) `lag` 0.01
    mdl = tWChooseId 'β' tr (mce [0.5,1.0,1.5]) (mce [0.75, 0.125, 0.125]) 0
    sig = sinOscFB ar (squ * mdl) 1.1 + whiteNoiseId 'γ' ar * 0.1
    rnd = tRandId 'δ' 0 1 tr
    env = envGen kr tr 1 0 (envdur / tempo) DoNothing (envPerc rnd (1 - rnd))
    flt = let c_off = lfSaw kr 0.1 0 `in_range` (0,0.2)
              c_mul = lfNoise2Id 'ε' kr 0.1 `in_range` (0.4,0.95)
              vca = lfNoise2Id 'ζ' kr 1 `in_range` (0,1)
          in X.lpg sig env c_off c_mul vca 1.1 1 0
in pan2 flt (0.5 * tRandId 'η' (-1) 1 tr) 0.25
