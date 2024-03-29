"sweepy noise (jmcc) #6"
| lfoDepth lfoRate freq filtered |
lfoDepth := MouseY minval: 200 maxval: 8000 warp: 1 lag: 0.1.
lfoRate := MouseX minval: 4 maxval: 60 warp: 1 lag: 0.1.
freq := LfSaw freq: lfoRate iphase: 0 mul: lfoDepth add: (lfoDepth * 1.2).
filtered := Rlpf in: [ WhiteNoise mul: 0.03 ] dup freq: freq kr rq: 0.1.
(CombN in: filtered maxdelaytime: 0.3 delaytime: 0.3 decaytime: 2) + filtered
