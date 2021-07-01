-- lpg
let tempo = 8
    envdur = 0.25
    trig = impulse kr tempo 0
    squ = demand trig 0 (dseqId 'α' dinf (mce [400,99,791,2000,200])) `lag` 0.01
    sig = sinOscFB ar squ 1.1 + whiteNoiseId 'β' ar * 0.1
    env = envGen kr trig 1 0 (envdur / tempo) DoNothing (envPerc 0.1 0.9)
    flt = let c_off = lfSaw kr 0.1 0 `in_range` (0,0.2)
              c_mul = lfNoise2Id 'γ' kr 0.1 `in_range` (0.4,0.95)
              vca = lfNoise2Id 'δ' kr 1 `in_range` (0,1)
          in X.lpg sig env c_off c_mul vca 1.1 1 0
in pan2 flt (0.5 * tRandId 'ε' (-1) 1 trig) 0.25
