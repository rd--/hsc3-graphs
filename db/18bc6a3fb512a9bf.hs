-- lpg
let freq = lfNoise2Id 'α' kr 1 `in_range` (1,4)
    tr = impulse kr freq 0
    env = envGen kr tr 1 0 (1 / freq * 0.05) DoNothing (envPerc 0.1 1.5)
    o1 = sinOsc kr (lag3 env 0.1 `in_range` (100,10)) 0
    o2 = sinOsc ar ((lfNoise2Id 'β' kr 1 `in_exprange` (200,1000)) * o1) 0
    sig = whiteNoiseId 'γ' ar * 0.2 + o2
    flt = let c_mul = lfNoise2Id 'δ' kr 10.1 `in_range` (0.5,0.95)
          in X.lpg sig env 0 c_mul 0.091 1.35 1 1
in pan2 flt (sinOsc kr 0.1 0 * 0.25) 0.25
