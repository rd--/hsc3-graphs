-- lpg
let tempo = 8
    envdur = 0.25
    trig = impulse KR tempo 0
    squ = demand trig 0 (dseq 'α' dinf (mce [400,99,791,2000,200])) `lag` 0.01
    sig = sinOscFB AR squ 1.1 + whiteNoise 'β' AR * 0.1
    env = envGen KR trig 1 0 (envdur / tempo) DoNothing (envPerc 0.1 0.9)
    flt = let c_off = lfSaw KR 0.1 0 `in_range` (0,0.2)
              c_mul = lfNoise2 'γ' KR 0.1 `in_range` (0.4,0.95)
              vca = lfNoise2 'δ' KR 1 `in_range` (0,1)
          in X.lpg sig env c_off c_mul vca 1.1 1 0
in pan2 flt (0.5 * tRand 'ε' (-1) 1 trig) 0.25
