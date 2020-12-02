"why supercollider (jmcc) #0"
|r s z c x|
r := [:_i| Resonz in: (Dust density: 0.2 mul: 50) freq: (200.0 rand: 3200.0) bwr: 0.003] .
s := 10 mixFill: r .
z := DelayN in: s maxdelaytime: 0.048 delaytime: 0.048 .
c := [:_i| CombL in: z maxdelaytime: 0.1 delaytime: (LFNoise1 freq: (0.1 rand) mul: 0.04 add: 0.05) decaytime: 15] .
x := 7 mixFill: c .
(1 to: 4) do: [:_i| x := AllpassN in: x maxdelaytime: 0.050 delaytime: {0.05 rand . 0.05 rand} decaytime: 1] .
x mul: 0.2 add: s