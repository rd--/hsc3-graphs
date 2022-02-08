"EnvSpec ; as triangle wave oscillator"
| f e |
f := MouseX minval: 110 maxval: #(220 330) warp: 0 lag: 0.2.
e := EnvSpec levels: #(0 0 1 0 -1) times: #(0.25 0.25 0.25 0.25) curves: #(#lin) releaseNode: nil loopNode: 0 offset: 0.
EnvGen gate: (Impulse freq: f phase: 0) levelScale: 0.1 levelBias: 0 timeScale: 1 / f doneAction: 0 envelope: e coord
