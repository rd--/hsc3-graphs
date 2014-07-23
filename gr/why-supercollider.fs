\ why supercollider (jmcc)
\ partial, doesn't implement sequential allpass filters

0.2 α Dust.ar 50 * 200 3200 β Rand.ir 0.003 Resonz
γ 10 uclone mix
dup
0.046 0.048 DelayN
0.1 0 0.1 ε Rand.ir δ LFNoise1.kr 0.04 * 0.05 + 15 CombL
ζ 7 uclone mix
0.05 0 0.05 η Rand.ir θ 2 uclone 1 AllpassN
0.2 * +
