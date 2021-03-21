-- lpg
let freq = lfNoise2 'α' KR 1 `in_range` (1,4)
    tr = impulse KR freq 0
    env = envGen KR tr 1 0 (1 / freq * 0.05) DoNothing (envPerc 0.1 1.5)
    o1 = sinOsc KR (lag3 env 0.1 `in_range` (100,10)) 0
    o2 = sinOsc AR ((lfNoise2 'β' KR 1 `in_exprange` (200,1000)) * o1) 0
    sig = whiteNoise 'γ' AR * 0.2 + o2
    flt = let c_mul = lfNoise2 'δ' KR 10.1 `in_range` (0.5,0.95)
          in X.lpg sig env 0 c_mul 0.091 1.35 1 1
in pan2 flt (sinOsc KR 0.1 0 * 0.25) 0.25
