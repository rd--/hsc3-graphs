"moogLadder"
| o cf |
o := (LfSaw freq: #(120 180) iphase: 0 mul: 0.33) sum.
cf := LinExp in: (LfCub freq: 0.1 iphase: (0.5 * Float pi)) srclo: -1 srchi: 1 dstlo: 180 dsthi: 8500.
MoogLadder in: o ffreq: cf kr res: 0.75
