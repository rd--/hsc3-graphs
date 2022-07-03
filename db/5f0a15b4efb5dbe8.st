"LFSaw ; output range is bi-polar"
| f |
f := LinLin in: (LFSaw freq: 0.5 iphase: 0) srclo: -1 srchi: 1 dstlo: 200 dsthi: 1600.
(SinOsc freq: {f. 200. 1600} phase: 0 mul: #(0.1 0.05 0.05)) sum
